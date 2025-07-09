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
        body: Column(
          children: [
            Icon(Icons.share, color: Colors.red, size: 60),
            SizedBox(height: 50),
            Icon(Icons.person, color: Colors.orange, size: 40),
            Text(
              'Mi primer proyecto Mi primer proyecto Mi primer proyecto Mi primer proyecto',
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 36.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Bienvenidos',
                children: [
                  TextSpan(
                    text: ' al curso',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(
                    text: ' de Dart y Flutter',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
