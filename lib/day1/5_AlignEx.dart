import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[200],
        ),
        drawer: Drawer(),
        body: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            child: Text("zzz"),
            // margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            color: Colors.blue,
            width: double.infinity,
            height: 100,
          ),
        ),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}
