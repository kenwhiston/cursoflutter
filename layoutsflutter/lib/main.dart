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
        appBar: AppBar(title: const Text('Demo')),
        body: Center(
          child: Row(
            children: [
              const Text('Msg 1'),
              const Text('Msg 2'),
              Expanded(child: Image.asset('images/lake.jpg'))
              
            ],
          ),
        ),
      ),
    );
  }
}
