import 'package:flutter/material.dart';
import 'home.dart';
import 'pantalla_one.dart';
import 'pantalla_two.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        //'/pantalla1': (context) => Pantalla1(),
        '/pantalla2': (context) => Pantalla2(),
      },
    );
  }
}
