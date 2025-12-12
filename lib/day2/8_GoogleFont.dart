import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          children: [
            Text('구글 폰트 가나다라마바사', style: GoogleFonts.actor()),
            Text(
              'This is Google Fonts',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Colors.blue, letterSpacing: .5)
              ),
            ),
            Text(
              '구글 폰트',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}