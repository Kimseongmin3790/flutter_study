import 'package:first_project/day4/UserView.dart';
import 'package:flutter/material.dart';
import 'UserEdit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'db.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Map<String, dynamic>> list = [];

  Future<void> _selectUserList() async{
    var userList = await DB.selectUser();
    setState(() {
      list = userList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("사용자목록"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          Map item = list[index];
          return ListTile(
            title : Text("아이디 : ${item["userId"]}, 이름 : ${item["name"]}"),
            subtitle: Text("나이 : ${item["age"]}"),
            trailing:
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () async{
                        bool flg = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UserEdit(userId : item["userId"])
                            )
                        );
                        if(flg){
                          _selectUserList();
                        }
                      },
                      icon: Icon(Icons.edit)
                  ),
                  IconButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text("삭제"),
                              content: Text("정말 삭제하시겠습니까?"),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    // int id = int.tryParse("${item["userId"]}") ?? 0;
                                    await DB.deleteUser(item["userId"]);
                                    Navigator.of(context).pop();
                                    _selectUserList();
                                  },
                                  child: Text("확인"),
                                ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("취소")
                                )
                              ],
                            );
                          }
                      ),
                      icon: Icon(Icons.delete)
                  ),
                ],
              ),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => UserView(userId : item["userId"])
                  )
              );
            },
          );
        },
      ),
    );
  }
}