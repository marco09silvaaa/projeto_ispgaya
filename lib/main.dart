import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
//import 'dart:math';
//import 'package:flutter/scheduler.dart';

// Função principal para executar a app
void main() => runApp(const TimeTableCalendar());

// StatefulWidget para o calendário de horários
class TimeTableCalendar extends StatefulWidget {
  const TimeTableCalendar({super.key});

  @override
  CalendarAppointment createState() => CalendarAppointment();
}

// Classe que gere o estado do TimeTableCalendar
class CalendarAppointment extends State<TimeTableCalendar> {
  // Fonte de dados do calendário
  final CalendarDataSource _dataSource = _DataSource(<Appointment>[]);
  // Listas para armazenar assuntos, horários de início e término e cores dos compromissos
  final List<String> _subjectCollection = <String>[];
  final List<DateTime> _startTimeCollection = <DateTime>[];
  final List<DateTime> _endTimeCollection = <DateTime>[];
  final List<Color> _colorCollection = <Color>[];
  List<TimeRegion> _specialTimeRegion = <TimeRegion>[];

  @override
  void initState() {
    // Inicializa as coleções de dados
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
        body: SafeArea(
          child: SfCalendar(
            dataSource: _dataSource, // Fonte de dados do calendário
            view: CalendarView.week, // Visualização padrão
            allowedViews: const [
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
              CalendarView.schedule
            ],
            specialRegions:
                _specialTimeRegion, // Regiões de tempo especiais no calendário
          ),
        ),
      ),
    );
  }

  // Inicializa a coleção de assuntos dos compromissos
  void _getSubjectCollection() {
    _subjectCollection.add('Sistemas de Informação');
    _subjectCollection.add('Gestão e Planeamento de Redes');
    _subjectCollection.add('Projeto');
    _subjectCollection.add('Computação em Nuvem');
  }

  // Inicializa a coleção de horários de início dos compromissos
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

  // Inicializa a coleção de horários de término dos compromissos
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

  // Inicializa a coleção de cores dos compromissos
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

// Classe que define a fonte de dados do calendário
class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
