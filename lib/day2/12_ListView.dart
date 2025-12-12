import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = ["자바", "오라클", "html"];
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(list[index]),
                leading: Icon(Icons.list),
                onTap: (){},
              );
            }
        ),
      ),
    );
  }
}