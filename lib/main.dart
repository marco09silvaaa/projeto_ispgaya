import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importar o pacote intl para formatação de datas

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 7,
        child: MeetingsPage(),
      ),
    );
  }
}

class MeetingsPage extends StatefulWidget {
  @override
  _MeetingsPageState createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> meetings = [
    {
      "time": "13:00 - 14:40",
      "location": "Blue str, 21",
      "title": "Project Planning"
    },
    {
      "time": "13:00 - 14:40",
      "location": "Blue str, 21",
      "title": "Project Planning"
    },
    {
      "time": "13:00 - 14:40",
      "location": "Blue str, 21",
      "title": "Project Planning"
    },
  ];

  List<String> daysOfWeek = [];

  late TabController _tabController;
  late String currentDay;
  late String currentMonth;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    // Definir o índice inicial com base no dia da semana atual
    int currentIndex = DateTime.now().weekday - 1;
    _tabController.animateTo(currentIndex);

    // Preencher a lista daysOfWeek com os dias formatados
    DateTime now = DateTime.now();
    for (int i = 0; i < 7; i++) {
      String formattedDate =
          DateFormat('dd EEE').format(now.add(Duration(days: i)));
      daysOfWeek.add(formattedDate);
    }

    // Obter o dia da semana atual
    currentDay = DateFormat('dd').format(DateTime.now());

    // Obter o mês atual
    currentMonth = DateFormat('MMMM').format(DateTime.now());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$currentDay $currentMonth",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
        backgroundColor: Colors.purple,
        bottom: TabBar(
          isScrollable: true,
          tabs: daysOfWeek.map((day) => Tab(text: day)).toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(7, (index) {
          return ListView.builder(
            itemCount: meetings.length,
            itemBuilder: (context, idx) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(meetings[idx]['title']!),
                    subtitle: Text(
                        "${meetings[idx]['time']} \n${meetings[idx]['location']}"),
                    isThreeLine: true,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
