import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_ispgaya/components/navbar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Appointment> _todayAppointments = [];

  @override
  void initState() {
    super.initState();
    _fetchTodayAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(50, 255, 160, 0),
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'images/logo_ispgaya.png',
                  height: 100,
                ),
              ),
              const SizedBox(height: 60),
              const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bem-vindo de volta Marco!',
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tarefas de hoje:',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildAppointmentList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: 0,
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
    );
  }

  Widget _buildAppointmentList() {
    if (_todayAppointments.isEmpty) {
      return const Center(child: Text('Nenhuma tarefa para hoje'));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _todayAppointments.length,
      itemBuilder: (context, index) {
        final appointment = _todayAppointments[index];
        final DateFormat timeFormat = DateFormat('HH:mm');
        final String startTime = timeFormat.format(appointment.startTime);
        final String endTime = timeFormat.format(appointment.endTime);
        return ListTile(
          title: Text(appointment.subject),
          subtitle: Text(
            '$startTime - $endTime\nSala: ${appointment.notes}',
          ),
          leading: CircleAvatar(
            backgroundColor: appointment.color,
          ),
        );
      },
    );
  }

  void _fetchTodayAppointments() async {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');
    QuerySnapshot snapshot = await events.get();
    List<Appointment> appointments = [];

    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      DateTime startTime = (data['startTime'] as Timestamp).toDate();
      DateTime endTime = (data['endTime'] as Timestamp).toDate();
      String subject = data['subject'];
      String room = data['room'] ?? '';
      Color color = Color(int.parse(data['color']));

      if (startTime.isAfter(startOfDay) && endTime.isBefore(endOfDay)) {
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
    }

    setState(() {
      _todayAppointments.addAll(appointments);
    });
  }
}
