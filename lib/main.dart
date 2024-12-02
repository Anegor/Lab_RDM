import 'package:flutter/material.dart';
import 'package:lab/screens/home_screen.dart';
import 'package:lab/screens/profile_screen.dart';
import 'package:lab/screens/register_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

