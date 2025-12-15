import 'package:flutter/material.dart';

class BPage extends StatelessWidget {
  final String? msg;
  const BPage({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[200],
        title: Text("b페이지"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(msg ?? "전달받은 값 없다")
          ],
        ),
      ),
    );
  }
}
