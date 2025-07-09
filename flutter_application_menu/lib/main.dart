import 'package:flutter/material.dart';

import 'pantalla_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 36.0,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 28.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches', style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(6.0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.yellowAccent),
              child: Text('Titulo de la App'),
            ),
            ListTile(
              title: Text('Titulo 01'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Pantalla1()),
                );
              },
            ),
            ListTile(title: Text('Titulo 02'), onTap: () {}),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar SnackBar'),
          onPressed: () {
            /*const snackBar = SnackBar(content: Text('Curso Flutter'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      '¡Hola desde el Bottom Sheet!',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Personas"),
          BottomNavigationBarItem(
            icon: Icon(Icons.time_to_leave),
            label: "Tiempo",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Libros"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAlertDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAlertDialog() {
    return AlertDialog(
      title: const Text('Alerta'),
      content: const Text('Este es un mensaje de alerta.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cerrar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // El usuario debe presionar un botón
      builder: (BuildContext context) {
        return _buildAlertDialog();
      },
    );
  }

}
