import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DialogEx(),
    );
  }
}

class DialogEx extends StatefulWidget {
  const DialogEx({super.key});

  @override
  State<DialogEx> createState() => _DialogExState();
}

class _DialogExState extends State<DialogEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => showDialog(
                context: context, 
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("삭제"),
                    content: Text("정말 삭제하시겠습니까?"),
                    actions: [
                      TextButton(
                          onPressed: (){},
                          child: Text("확인")
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text("취소")
                      ),

                    ],
                  );
                }
            ), 
            child: Text("클릭")
        ),
      ),
    );
  }
}
