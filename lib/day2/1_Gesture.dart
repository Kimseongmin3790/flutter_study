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
  var Flg = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: (){
          setState(() {
            Flg = !Flg;
          });
        },
        child: Container(
          color: Flg == false ? Colors.black : Colors.white,
          child: Center(
            child: Text("클릭!", style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Flg == false ? Colors.white : Colors.black
            )
            ),
          ),
        ),
      ),
    );
  }
}
