import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyIndicatorState(),
    );
  }
}

class MyIndicatorState extends StatefulWidget {
  const MyIndicatorState({super.key});

  @override
  State<MyIndicatorState> createState() => _MyIndicatorStateState();
}

class _MyIndicatorStateState extends State<MyIndicatorState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 6.0,
              percent: 0.70,
              center: Text("70%"),
              progressColor: Colors.green,
              animation: true,
              animationDuration: 1200,
            ),
            SizedBox(height: 40,),
            LinearPercentIndicator(
              lineHeight: 30.0,
              percent: 0.8,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
              center: Text("80%"),
              animation: true,
              animationDuration: 1000,
              barRadius: Radius.circular(40),
            ),
          ],
        ),
      ),
    );
  }
}

