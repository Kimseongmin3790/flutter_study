import 'dart:math';
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
  final Random _ran = Random();
  int ranNum = 0;

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("랜덤 숫자:$ranNum"),
              ElevatedButton(
                  onPressed: (){
                    // _ran.nextInt(10); // 0~9 사이 값 랜덤
                    // _ran.nextDouble(); // 0.0~1.0 사이 값 랜덤
                    // _ran.nextDouble() * 9 + 1; // 0~10 사이 값
                    setState(() {
                      ranNum = _ran.nextInt(10)+1;
                    });
                  },
                  child: Text("랜덤 숫자 뽑기")
              )
            ],
          ),
        ),
      ),
    );
  }
}
