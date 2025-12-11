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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.arrow_back_ios_new),
            ElevatedButton(onPressed: (){}, child: Text("버튼")),
            IconButton(onPressed: (){}, icon: Icon(Icons.navigate_next)),
            Container(width: 50, height: 50, color: Colors.blue,),
            // Container <-> SizedBox 와 거의 유사
            Image.asset("image.jfif", width: 150, height: 150,),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("image-14.png"),
            )
          ],
        ),
      ),
    );
  }
}