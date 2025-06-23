import 'package:flutter/material.dart';
import 'dart:math'; // For generating unique IDs

void main() {
  runApp(const MyApp());
}

// Data model for a Task
class Task {
  String id;
  String title;
  bool isDone; // Optional: to mark tasks as completed

  Task({required this.id, required this.title, this.isDone = false});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tareas Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue), // Changed seed color
        useMaterial3: true,
      ),
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Task> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  // --- Task Operations ---

  void _addTask(String title) {
    if (title.isEmpty) return; // Don't add empty tasks
    setState(() {
      _tasks.add(Task(id: DateTime.now().millisecondsSinceEpoch.toString(), title: title)); // Unique ID
    });
    _taskController.clear(); // Clear the input field
    Navigator.of(context).pop(); // Close the dialog
  }

  void _removeTask(String id) {
    setState(() {
      _tasks.removeWhere((task) => task.id == id);
    });
  }

  void _editTask(String id, String newTitle) {
    if (newTitle.isEmpty) return;
    setState(() {
      final taskIndex = _tasks.indexWhere((task) => task.id == id);
      if (taskIndex != -1) {
        _tasks[taskIndex].title = newTitle;
      }
    });
    _taskController.clear();
    Navigator.of(context).pop(); // Close the dialog
  }

  void _toggleTaskDone(String id) {
    setState(() {
      final taskIndex = _tasks.indexWhere((task) => task.id == id);
      if (taskIndex != -1) {
        _tasks[taskIndex].isDone = !_tasks[taskIndex].isDone;
      }
    });
  }


  // --- Dialogs ---

  void _showAddTaskDialog() {
    _taskController.clear(); // Ensure controller is clear for new task
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nueva Tarea'),
          content: TextField(
            controller: _taskController,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Descripción de la tarea'),
            onSubmitted: (_) => _addTask(_taskController.text), // Add on submit
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Agregar'),
              onPressed: () {
                _addTask(_taskController.text);
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditTaskDialog(Task task) {
    _taskController.text = task.title; // Pre-fill with existing title
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Tarea'),
          content: TextField(
            controller: _taskController,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Nueva descripción'),
            onSubmitted: (_) => _editTask(task.id, _taskController.text), // Edit on submit
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Guardar'),
              onPressed: () {
                _editTask(task.id, _taskController.text);
              },
            ),
          ],
        );
      },
    );
  }


  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mi Lista de Tareas'),
      ),
      body: _tasks.isEmpty
          ? const Center(
        child: Text(
          'No hay tareas pendientes.\n¡Agrega una nueva tarea!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Card( // Using Card for better visual separation
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              leading: Checkbox(
                value: task.isDone,
                onChanged: (bool? value) {
                  _toggleTaskDone(task.id);
                },
              ),
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isDone ? TextDecoration.lineThrough : null,
                  color: task.isDone ? Colors.grey : null,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min, // Important for Row in ListTile
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _showEditTaskDialog(task),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeTask(task.id),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        tooltip: 'Agregar Tarea',
        child: const Icon(Icons.add),
      ),
    );
  }
}