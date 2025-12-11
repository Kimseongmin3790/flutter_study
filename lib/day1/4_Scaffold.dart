import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text("상단 영역, 타이틀"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              // Container(
              //   height: 200,
              //   color: Colors.green[200],
              // ),
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green[200]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("image.jfif"),
                    ),
                    Text("홍길동", style: TextStyle(color: Colors.blue)),
                    Text("hong@naver.com", style: TextStyle(color: Colors.blue)),
                  ],
                )
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("홈"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("카메라"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("로그아웃"),
                onTap: (){},
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Image.asset("image-14.png", width: 60, height: 60, fit: BoxFit.contain,),
              title: Text("아주 좋은 노트북", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("150,000원, 인천 부평동",),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              onTap: (){
                print("제품 클릭");
              },
            ),
            Divider(height: 2, color: Colors.grey,),
            ListTile(
              leading: Image.asset("image.jfif", width: 60, height: 60, fit: BoxFit.contain,),
              title: Text("페이커 마우스", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("200,000원, 서울 강남구",),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              onTap: (){
                print("제품 클릭");
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.navigate_before), iconSize: 40,),
              IconButton(onPressed: (){}, icon: Icon(Icons.home), iconSize: 40,),
              IconButton(onPressed: (){}, icon: Icon(Icons.navigate_next), iconSize: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
