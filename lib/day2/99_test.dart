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
  var num = 0;
  var _color = Colors.purple;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[200],
          title: Text("숫자 증가"),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("버튼 누르면 숫자 증가"),
                      Text(num.toString())
                    ],
                  ),
                )
              ),
              Align(
                child: Container(
                  height: 100,
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        // num++;
                        num = num + 1;
                        num % 2 == 1 ? _color = Colors.blue : _color = Colors.purple;
                      });
                    },
                    child: Text("+"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _color,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.zero
                      // )
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
