import 'package:flutter/material.dart';
import 'UserEdit.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});


  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> list = [
      {"userId" : "hong", "name" : "홍길동", "age" : 30},
      {"userId" : "kim", "name" : "김철수", "age" : 25},
      {"userId" : "park", "name" : "박영희", "age" : 20}
    ];
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
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UserEdit(name: "${item["name"]}", age: "${item["age"]}")
                            )
                        );
                      },
                      icon: Icon(Icons.edit)
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UserEdit()
                            )
                        );
                      },
                      icon: Icon(Icons.delete)
                  ),
                ],
              ),
          );
        },
      ),
    );
  }
}