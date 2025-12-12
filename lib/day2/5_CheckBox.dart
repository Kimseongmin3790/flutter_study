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
  List<String> checkedList = [

  ];
  List<String> imgList = [
    "java.jpg", "oracle.jpg", "html.jpg"
  ];

  void listChanged(String subject, bool isChecked){
    setState(() {
      if(isChecked) {
        checkedList.add(subject);
      } else {
        checkedList.remove(subject);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ListTile(
              title: Text("자바"),
              leading: Checkbox(
                  value: checkedList.contains(imgList[0]),
                  onChanged: (value){
                    listChanged(imgList[0], value!);
                  }
              ),
              onTap: (){
                bool isChecked = checkedList.contains(imgList[0]);
                listChanged(imgList[0], !isChecked);
              },
            ),
            ListTile(
              title: Text("오라클"),
              leading: Checkbox(
                  value: checkedList.contains(imgList[1]),
                  onChanged: (value){
                    listChanged(imgList[1], value!);
                  }
              ),
              onTap: (){
                bool isChecked = checkedList.contains(imgList[1]);
                listChanged(imgList[1], !isChecked);
              },
            ),
            ListTile(
              title: Text("html"),
              leading: Checkbox(
                  value: checkedList.contains(imgList[2]),
                  onChanged: (value){
                    listChanged(imgList[2], value!);
                  }
              ),
              onTap: (){
                bool isChecked = checkedList.contains(imgList[2]);
                listChanged(imgList[2], !isChecked);
              },
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                ),
                itemCount: checkedList.length,
                itemBuilder: (context, index){
                  return Image.asset(checkedList[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}