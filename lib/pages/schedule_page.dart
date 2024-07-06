import 'package:flutter/material.dart';
import 'package:projeto_ispgaya/services/database_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_ispgaya/components/navbar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  CalendarAppointment createState() => CalendarAppointment();
}

class CalendarAppointment extends State<SchedulePage> {
  final DatabaseService databaseService = DatabaseService();

  final CalendarDataSource _dataSource = _DataSource(<Appointment>[]);

  @override
  void initState() {
    super.initState();
    _fetchAppointmentsFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SfCalendar(
                  dataSource: _dataSource,
                  view: CalendarView.week,
                  allowedViews: const [
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.month,
                    CalendarView.schedule
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _addNewEvent,
                  child: const Text('Adicionar Evento'),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(
          currentIndex: 1,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, '/');
                break;
              case 1:
                Navigator.pushReplacementNamed(context, '/schedule');
                break;
              case 2:
                Navigator.pushReplacementNamed(context, '/bar');
                break;
              case 3:
                Navigator.pushReplacementNamed(context, '/user');
                break;
            }
          },
        ),
      ),
    );
  }

  void _addNewEvent() {
    final DateTime startTime = DateTime.now().add(const Duration(hours: 1));
    final DateTime endTime = startTime.add(const Duration(hours: 1));
    final Appointment newAppointment = Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Novo Evento',
      color: Colors.blue,
    );

    setState(() {
      (_dataSource.appointments as List<Appointment>).add(newAppointment);
      _dataSource.notifyListeners(
          CalendarDataSourceAction.add, <Appointment>[newAppointment]);
    });
  }

  void _fetchAppointmentsFromFirebase() async {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');

    QuerySnapshot snapshot = await events.get();
    List<Appointment> appointments = [];

    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      DateTime startTime = (data['startTime'] as Timestamp).toDate();
      DateTime endTime = (data['endTime'] as Timestamp).toDate();
      String subject = data['subject'];
      Color color = Color(int.parse(data['color']));

      appointments.add(
        Appointment(
          startTime: startTime,
          endTime: endTime,
          subject: subject,
          color: color,
        ),
      );
    }

    setState(() {
      _dataSource.appointments!.addAll(appointments);
      _dataSource.notifyListeners(CalendarDataSourceAction.reset, appointments);
    });
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
