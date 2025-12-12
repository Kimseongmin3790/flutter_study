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
  var _item = "java";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            RadioListTile<String>(
              title: Text("자바"),
              value: "java",
              groupValue: _item,
              onChanged: (value){
                setState(() {
                  _item = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text("오라클"),
              value: "oracle",
              groupValue: _item,
              onChanged: (value){
                setState(() {
                  _item = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text("html"),
              value: "html",
              groupValue: _item,
              onChanged: (value){
                setState(() {
                  _item = value!;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}