import 'package:flutter/material.dart';

import 'pantalla_one.dart';
//import 'pantalla_one.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Ir a Pantalla1"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pantalla1(data: 'Curso flutter')),
            );
            //Navigator.pushNamed(context, '/pantalla1');
          },
        ),
      ),
    );
  }
}
