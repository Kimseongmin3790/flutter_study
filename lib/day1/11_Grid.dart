import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'C', '(', '%', '/',
      '7', '8', '9', '*',
      '4', '5', '6', '-',
      '1', '2', '3', '+',
      '0', '00', '.', '='
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("계산기"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
          ),
          itemCount: labels.length,
          itemBuilder: (context, index){
            return ElevatedButton(
              onPressed: (){},
              child: Center(
                child: Text(labels[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
              ),
            );
          },
        ),
      ),
    );
  }
}