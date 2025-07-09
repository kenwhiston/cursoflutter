import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body:Container(
          height: 400,
          child: CarouselView(
          scrollDirection: Axis.horizontal,
          itemExtent: double.infinity, 
          children: List<Widget>.generate(10,(int index){
            return Container(
              color: Colors.amber,
              child: Center(
                child: Text('Item $index'),));
          })
          ),
        )
      ),
    );
  }
}
