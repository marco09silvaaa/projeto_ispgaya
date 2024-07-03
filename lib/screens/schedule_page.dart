import 'package:flutter/material.dart';
import 'package:projeto_ispgaya/navbar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimeTableCalendar extends StatefulWidget {
  const TimeTableCalendar({super.key});

  @override
  CalendarAppointment createState() => CalendarAppointment();
}

class CalendarAppointment extends State<TimeTableCalendar> {
  final CalendarDataSource _dataSource = _DataSource(<Appointment>[]);
  final List<String> _subjectCollection = <String>[];
  final List<DateTime> _startTimeCollection = <DateTime>[];
  final List<DateTime> _endTimeCollection = <DateTime>[];
  final List<Color> _colorCollection = <Color>[];
  final List<TimeRegion> _specialTimeRegion = <TimeRegion>[];

  @override
  void initState() {
    _getSubjectCollection();
    _getStartTimeCollection();
    _getEndTimeCollection();
    _getColorCollection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar:
            const NavBar(), // Adiciona a NavBar na parte inferior da tela
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
            specialRegions: _specialTimeRegion,
          ),
        ),
      ),
    );
  }

  void _getSubjectCollection() {
    _subjectCollection.add('Sistemas de Informação');
    _subjectCollection.add('Gestão e Planeamento de Redes');
    _subjectCollection.add('Projeto');
    _subjectCollection.add('Computação em Nuvem');
  }

  void _getStartTimeCollection() {
    var currentDateTime = DateTime.now();
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 14, 30, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 16, 0, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 18, 00, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 19, 30, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 21, 30, 0));
  }

  void _getEndTimeCollection() {
    var currentDateTime = DateTime.now();
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 16, 0, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 17, 30, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 19, 30, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 21, 0, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 23, 30, 0));
  }

  void _getColorCollection() {
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF36B37B));
    _colorCollection.add(const Color(0xFF01A1EF));
    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFFE47C73));
    _colorCollection.add(const Color(0xFF636363));
    _colorCollection.add(const Color(0xFF0A8043));
    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
