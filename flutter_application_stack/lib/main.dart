import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.yellow,
          width: 300,
          height: 300,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
