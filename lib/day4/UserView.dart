import 'package:flutter/material.dart';
import 'db.dart';

class UserView extends StatefulWidget {
  final int? userId;
  const UserView({super.key, this.userId});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Map info = {};

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async{
    List<Map<String, dynamic>> list = await DB.getUser(widget.userId!);
    setState(() {
      info = list.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("상세정보"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("아이디 : ${info["userId"]}"),
              Text("이름 : ${info["name"]}"),
              Text("나이 : ${info["age"]}"),
            ],
          ),
        ),
    );
  }
}