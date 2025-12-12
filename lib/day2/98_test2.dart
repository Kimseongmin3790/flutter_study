import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var Flg = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Align(
          alignment: Flg == false ? Alignment.center : Alignment.topCenter,
          child: ElevatedButton(
              onPressed: (){
                setState(() {
                  Flg = !Flg;
                });
              },
              child: Flg == false ? Text("Flutter") : Text("text"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Flg == false ? Colors.blue : Colors.purple
              ),
          ),
        ),
      ),
    );
  }
}