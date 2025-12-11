import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("탭바"),
              bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.home),text: "홈",),
                    Tab(icon: Icon(Icons.star, color: Colors.yellow,),text: "즐겨찾기",),
                    Tab(icon: Icon(Icons.person),text: "프로필",)
                  ]
              ),
            ),
            body: TabBarView(
                children: [
                  Center(child: Text("홈!"),),
                  Center(child: Text("즐겨찾기!!"),),
                  Center(child: Text("프로필!!!"),)
                ]
            ),
          )
      ),
    );
  }
}