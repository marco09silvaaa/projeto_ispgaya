import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:projeto_ispgaya/Screens/home_page.dart';
import 'package:projeto_ispgaya/screens/schedule_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0; // Índice inicialmente selecionado

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TimeTableCalendar(),
    // Adicione mais páginas aqui
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/schedule');
        break;
      // Adicionar mais casos conforme necessário para outras páginas
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 160, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          backgroundColor: const Color.fromARGB(255, 255, 160, 0),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: const Color.fromARGB(255, 70, 70, 70),
          gap: 8,
          padding: const EdgeInsets.all(16),
          selectedIndex: _selectedIndex, // Define o índice selecionado
          onTabChange: _onItemTapped,
          tabs: const [
            GButton(icon: LineIcons.home, text: 'Início'),
            GButton(icon: LineIcons.calendar, text: 'Horário'),
            GButton(icon: LineIcons.shoppingBag, text: 'Bar'),
            GButton(icon: LineIcons.user, text: 'Utilizador')
          ],
        ),
      ),
    );
  }
}
