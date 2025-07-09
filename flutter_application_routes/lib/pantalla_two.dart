import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla2')),
      body: Center(
        child: ElevatedButton(
          child: const Text("Regresar a Pantalla1"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
