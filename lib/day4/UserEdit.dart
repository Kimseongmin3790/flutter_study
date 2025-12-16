import 'package:first_project/day4/UserList.dart';
import 'package:flutter/material.dart';
import 'db.dart';

class UserEdit extends StatefulWidget {
  final int? userId;
  const UserEdit({super.key, this.userId});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async{
    List<Map<String, dynamic>> list = await DB.getUser(widget.userId!);
    Map info = list.first;
    setState(() {
      nameCtrl.text = info["name"].toString();
      ageCtrl.text = info["age"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                DB.updateUser(widget.userId!, nameCtrl.text, int.tryParse(ageCtrl.text)!);
                Navigator.pop(context, true);
              },
              child: Text("수정")
          )
        ],
      ),
    );
  }
}