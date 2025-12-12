import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _emailCtrl = TextEditingController();
  // var _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailCtrl,
                  decoration: InputDecoration(
                    labelText: "이메일",
                    hintText: "ex) test@naver.com",
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.check_circle, color: Colors.green,),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.blue[100],
                    // enabled: false
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      print("입력된 값 : ${_emailCtrl.text}");
                    },
                    child: Text("가입")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
