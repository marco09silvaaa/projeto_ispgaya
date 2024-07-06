import 'package:flutter/material.dart';
import 'package:projeto_ispgaya/components/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo da Home Page',
          style: TextStyle(fontSize: 24.0),
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
}
