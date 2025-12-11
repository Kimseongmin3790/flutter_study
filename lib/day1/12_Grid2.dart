import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'image.jfif', 'image-14.png', 'dbd.jfif',
      'dyingLight.jfif', 'lastofus.jfif', 'overwatch2.jfif'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[200],
          title: Text("계산기"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
          ),
          itemCount: labels.length,
          itemBuilder: (context, index){
            return Container(
              child: Image.asset(labels[index])
            );
          },
        ),
      ),
    );
  }
}