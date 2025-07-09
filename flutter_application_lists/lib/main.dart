import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<String> items = <String>['item01', 'item02', 'item03', 'item04'];
  final List<int> colorCodes = <int>[200,300,500,800];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: items.isNotEmpty  ? ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),
          padding: EdgeInsets.all(8.0),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 60,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text(items[index]),),
            );
          }
          )
          : Center(child: Text('No existen items'),),
      ),
    );
  }
}
