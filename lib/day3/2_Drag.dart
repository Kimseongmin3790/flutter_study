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
  Offset position = Offset(150, 150);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
                left: position.dx,
                top: position.dy,
                child: GestureDetector(
                  // onTap: (){
                  //     print("클릭 됨");
                  // },
                  onPanUpdate: (details){
                    setState(() {
                      position += details.delta;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}