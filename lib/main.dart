import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_ispgaya/pages/crud_page.dart';
import 'package:projeto_ispgaya/pages/home_page.dart';
import 'package:projeto_ispgaya/firebase_options.dart';
import 'package:projeto_ispgaya/pages/bar_page.dart';
import 'package:projeto_ispgaya/pages/login_page.dart';
import 'package:projeto_ispgaya/pages/schedule_page.dart';
import 'package:projeto_ispgaya/pages/user_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISPGAYA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/': (context) => const HomePage(),
        '/schedule': (context) => const CrudPage(),
        '/bar': (context) => const BarPage(),
        '/user': (context) => const UserPage(),
      },
    );
  }
}
