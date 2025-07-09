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
            TitleSection(title: 'Flutter Tutorial'),
            Image.asset('images/lake.jpg'),
            SizedBox(height: 30.0),
            DescriptionSection(name: 'Lago Titicaca', zone: 'Puno, Perú', stars: '41',),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.phone, size: 36, color: Colors.deepPurple),
                      SizedBox(height: 8.0,),
                      Text(
                        'CALL',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.gps_fixed, size: 36, color: Colors.deepPurple),
                      SizedBox(height: 8.0,),
                      Text(
                        'ROUTE',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share, size: 36, color: Colors.deepPurple),
                      SizedBox(height: 8.0,),
                      Text(
                        'SHARE',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'El lago Titicaca se extiende por la frontera entre Perú y Bolivia en la cordillera de los Andes y es uno de los lagos más grandes de Sudamérica y el cuerpo de agua navegable más alto del mundo. Se dice que es la cuna de los incas y cuenta con varias ruinas. Sus aguas son conocidas por ser tranquilas y dar un reflejo brillante. En sus alrededores, se ubica la Reserva Nacional del Titicaca que alberga especies acuáticas poco comunes, como las ranas gigantes',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black54),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.name,
    required this.zone,
    required this.stars
  });

  final String name;
  final String zone;
  final String stars;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                zone,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red, size: 24),
              SizedBox(width: 8.0,),
              Text(stars),
            ],
          ),
        ],
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
