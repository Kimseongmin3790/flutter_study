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
  late List<Widget> list = [];

  final Random _ran = Random();
  // late Offset position = Offset(_ran.nextDouble() * 500, _ran.nextDouble() * 600);
  int currentIdx = 0;

  void _randomBox(){
    List<Widget> tempList = [];
    for(int i=1; i<=10; i++){
      tempList.add(Positioned(
          left: _ran.nextDouble() * (MediaQuery.of(context).size.width - 50),
          top: _ran.nextDouble() * (MediaQuery.of(context).size.height - 100),
          child: GestureDetector(
            onTap: (){
              _removeBox(i-1);
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
              child: Center(child: Text("$i")),
            ),
          )
      ));
    }
    setState(() {
      list = tempList;
    });
  }

  void _removeBox(int index){
    if(index == currentIdx) {
      currentIdx++;
      setState(() {
        list.removeAt(0);
      });
    }
    if(list.length == 0){
      currentIdx = 0;
      _randomBox();
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(child: Stack(
              children: list,
            )),
            Container(
              height: 50,
              color: Colors.green[200],
              child: Center(
                child: ElevatedButton(
                    onPressed: _randomBox,
                    child: Text("버튼 위치 이동")
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}