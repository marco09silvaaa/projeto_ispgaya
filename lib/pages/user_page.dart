import 'package:flutter/material.dart';
import 'package:projeto_ispgaya/components/navbar.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo da User Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: 3,
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
