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
  List<Widget> list = [];
  int next = 1; // ✅ 다음에 눌러야 하는 번호

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _randomBox()); // ✅ 로딩 시 생성
  }

  void _randomBox() {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    next = 1; // ✅ 순서 초기화
    list = List.generate(10, (idx) {
      final id = idx + 1;
      return Positioned(
        key: ValueKey(id), // ✅ 번호 키
        left: _ran.nextDouble() * (w - 50),
        top: _ran.nextDouble() * (h - 50),
        child: GestureDetector(
          onTap: () {
            if (id != next) return; // ✅ 순서 아니면 삭제 X
            setState(() {
              list.removeWhere((w) => w.key == ValueKey(id)); // ✅ 해당 번호만 삭제
              next++;
            });
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text("$id", style: const TextStyle(color: Colors.white)),
          ),
        ),
      );
    });

    setState(() {}); // list 갱신
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: list),
      ),
    );
  }
}