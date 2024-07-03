import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:projeto_ispgaya/screens/schedule_page.dart';

//ver vídeo: https://www.youtube.com/watch?v=Uw0T4ZIgFgs

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Google Nav Bar"),
        ),
      ),
    );
  }
}
