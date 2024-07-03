import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:projeto_ispgaya/screens/schedule_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 255, 160, 0),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 255, 160, 0),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 70, 70, 70),
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(icon: LineIcons.home, text: 'Início'),
              GButton(icon: LineIcons.calendar, text: 'Horário'),
              GButton(icon: LineIcons.shoppingBag, text: 'Bar'),
              GButton(icon: LineIcons.user, text: 'Utilizador')
            ],
          ),
        ),
      ),
      /*body: const TabBarView(
        children: [
          HomePage(),
          TimeTableCalendar(),
          HomePage(),
          TimeTableCalendar()
        ],
      ),*/
    );
  }
}
