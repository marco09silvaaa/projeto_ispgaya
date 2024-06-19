import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDebZkJf-mldUAh_qxpfCMtUn7i-HRVJ3k",
            authDomain: "ispgaya-app.firebaseapp.com",
            projectId: "ispgaya-app",
            storageBucket: "ispgaya-app.appspot.com",
            messagingSenderId: "944688189811",
            appId: "1:944688189811:web:6fa085b567a9f9d8ce7506",
            measurementId: "G-5J004ST51B"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login & Register',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
