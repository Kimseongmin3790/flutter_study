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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SnackBarEx()
          ],
        ),
      ),
    );
  }
}

class SnackBarEx extends StatefulWidget {
  const SnackBarEx({super.key});

  @override
  State<SnackBarEx> createState() => _SnackBarExState();
}

class _SnackBarExState extends State<SnackBarEx> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("안녕?111aaaabbb"),
                  action: SnackBarAction(
                      label: "닫기",
                      onPressed: (){}
                  ),
                duration: Duration(seconds: 3),
              )
            );
          },
          child: Text("클릭")
      ),
    );
  }
}
