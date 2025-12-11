import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 200,
              child: Container(
                color: Colors.blue,
                width: 100, height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}