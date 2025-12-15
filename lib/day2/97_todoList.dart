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
  TextEditingController _todoCtrl = TextEditingController();
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("할 일")),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoCtrl,
                    decoration: InputDecoration(
                      labelText: "할 일 입력"
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    list.add(_todoCtrl.text);
                  });
                }, child: Text("추가"))
              ],
            ),
            Expanded(child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(list[index]),
                    leading: Icon(Icons.list),
                    onTap: (){},
                  );
                }
            ))
          ],
        ),
      ),
    );
  }
}