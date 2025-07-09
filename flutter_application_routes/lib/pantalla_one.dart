import 'package:flutter/material.dart';
//import 'pantalla_two.dart';

class Pantalla1 extends StatelessWidget {

  final String data;

  const Pantalla1({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla1'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Pantalla1: $data'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Ir a Pantalla2'),
            onPressed: () {
              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Pantalla2()));*/
                  Navigator.pushNamed(context, '/pantalla2');
            }),
            ElevatedButton(
            child: const Text('Regresar a Home'),
            onPressed: () {
              Navigator.pop(context);
            })
        ],
      ),
    );
  }
}