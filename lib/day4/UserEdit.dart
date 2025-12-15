import 'package:first_project/day4/UserList.dart';
import 'package:flutter/material.dart';

class UserEdit extends StatelessWidget {
  final String? name;
  final String? age;
  const UserEdit({super.key, this.name, this.age});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameCtrl = TextEditingController(text: name);
    TextEditingController ageCtrl = TextEditingController(text: age);
    return Scaffold(
      appBar: AppBar(
        title: Text("사용자 수정"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                  labelText: "이름"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: ageCtrl,
              decoration: InputDecoration(
                  labelText: "나이"
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => UserList()
                    )
                );
              },
              child: Text("수정")
          )
        ],
      ),
    );
  }
}