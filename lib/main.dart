import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_ispgaya/Screens/home_page.dart';
import 'package:projeto_ispgaya/screens/login_page.dart';
import 'package:projeto_ispgaya/firebase_options.dart';
import 'package:projeto_ispgaya/screens/schedule_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Rota inicial
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/schedule': (context) => TimeTableCalendar(),
      },
    );
  }
}
