import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    String valor = "";
    //FocusNode nodeUno = FocusNode();
    //FocusNode nodeDos = FocusNode();

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 36.0),
            Text('Hello World!'),
            TextField(
              keyboardType: TextInputType.number,

              onChanged: (texto) {
                valor = texto;
              },
            ),
            TextField(
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
              cursorColor: Colors.red,
              cursorRadius: Radius.circular(12.0),
              cursorWidth: 12.0,
              maxLength: 500,
              maxLines: 8,
            ),
            TextField(
              decoration: InputDecoration(
                prefix: Icon(Icons.email),
                hintText: "Ingrese una email",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.red,
                ),
                helperText: "Ingrese su correo personal",
                helperStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w400,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            TextField(
              decoration: InputDecoration.collapsed(hintText: ""),
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.next,
            ),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              keyboardType: TextInputType.numberWithOptions(),
              textInputAction: TextInputAction.send,
              obscureText: true,
            ),
            TextField(keyboardType: TextInputType.multiline),
            TextField(keyboardType: TextInputType.phone),
            IconButton(
              icon: Icon(Icons.next_plan),
              onPressed: () {
                //FocusScope.of(context).requestFocus(nodeDos);
              },
            ),
          ],
        ),
      ),
    );
  }
}
