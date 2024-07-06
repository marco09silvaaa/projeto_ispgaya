import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 160, 0),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            duration: const Duration(milliseconds: 600),
            tabBackgroundColor: const Color.fromARGB(255, 70, 70, 70),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Início',
                textStyle: TextStyle(color: Colors.white),
              ),
              GButton(
                icon: Icons.calendar_today,
                text: 'Horário',
                textStyle: TextStyle(color: Colors.white),
              ),
              GButton(
                icon: Icons.local_bar,
                text: 'Bar',
                textStyle: TextStyle(color: Colors.white),
              ),
              GButton(
                icon: Icons.person,
                text: 'Utilizador',
                textStyle: TextStyle(color: Colors.white),
              ),
            ],
            selectedIndex: currentIndex,
            onTabChange: onTap,
          ),
        ),
      ),
    );
  }
}
