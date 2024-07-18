import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_ispgaya/components/navbar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  CalendarAppointment createState() => CalendarAppointment();
}

class CalendarAppointment extends State<SchedulePage> {
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
          child: SfCalendar(
            dataSource: _dataSource,
            view: CalendarView.week,
            allowedViews: const [
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
              CalendarView.schedule
            ],
            appointmentBuilder: (context, details) {
              final Appointment appointment = details.appointments.first;
              return Container(
                decoration: BoxDecoration(
                  color: appointment.color,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        appointment.subject,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    if (appointment.notes != null &&
                        appointment.notes!.isNotEmpty)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Text(
                          appointment.notes!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                  ],
                ),
              );
            },
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
      String room = data['room'] ?? '';
      Color color = Color(int.parse(data['color']));

      appointments.add(
        Appointment(
          startTime: startTime,
          endTime: endTime,
          subject: subject,
          color: color,
          notes: room,
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
