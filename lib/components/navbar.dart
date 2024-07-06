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
      height: 70,
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: GNav(
            gap: 12,
            activeColor: Colors.white,
            iconSize: 28,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            duration: const Duration(milliseconds: 600),
            tabBackgroundColor: const Color.fromARGB(255, 122, 78, 0),
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Início',
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              GButton(
                icon: LineIcons.calendar,
                text: 'Horário',
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              GButton(
                icon: LineIcons.coffee,
                text: 'Bar',
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Utilizador',
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
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
