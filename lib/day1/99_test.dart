import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){}, child: Text("버튼 1")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.heart_broken_outlined, color: Colors.red, size: 60,),
                Icon(Icons.home, color: Colors.blue, size: 60,),
                Icon(Icons.star, color: Colors.green, size: 60,),
              ]
            ),
            Image.asset("image.jfif", width: 150, height: 150,)
          ],
        ),
      ),
    );
  }
}