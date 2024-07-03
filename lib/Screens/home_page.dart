import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:projeto_ispgaya/screens/schedule_page.dart';
import 'package:projeto_ispgaya/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      bottomNavigationBar:
          const NavBar(), // Adiciona a NavBar na parte inferior da tela
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Conteúdo da Home Page',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,
                    '/schedule'); // Navega para a página SchedulePage ao pressionar o botão
              },
              child: const Text('Ir para Horário'),
            ),
          ],
        ),
      ),
    );
  }
}
