import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  // 데이터베이스 경로와 이름 정의
  static Future<Database> getDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    // 데이터베이스가 없다면 생성하고 테이블을 생성하는 작업
// 버전 업
    return await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE Test(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT, 
          value INTEGER, 
          num REAL
        )
      ''');
      await db.execute('''
        CREATE TABLE TBL_USER(
          userId INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT, 
          age INTEGER
        )
      ''');

    },
// 새롭게 추가될 경우
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('''
        CREATE TABLE TBL_USER(
          userId INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT, 
          age INTEGER
        )
      ''');
        }
      },
    );

  }



  // 데이터 삽입(함수)
  static Future<void> insertData(String name, int age) async {
    print("name === > $name");
    final db = await getDatabase();
    await db.insert('TBL_USER', {'name': name, 'age': age});
  }

  static Future<List<Map<String, dynamic>>> selectUser() async {
    final db = await getDatabase();
    return await db.query('TBL_USER'); // 'Test' 테이블의 모든 데이터를 조회
  }

  static Future<int> deleteUser(int id) async {
    final db = await getDatabase();
    return await db.delete('TBL_USER', where: 'userId = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getUser(int id) async {
    final db = await getDatabase();
    return await db.query('TBL_USER', where: 'userId = ?', whereArgs : [id]); // 'Test' 테이블의 모든 데이터를 조회
  }

  static Future<int> updateUser(int id, String name, int age) async {
    final db = await getDatabase();
    return await db.update('TBL_USER', {'name': name, 'age': age},
        where: 'userId = ?', whereArgs: [id]);
  }

//  데이터 삽입(쿼리)
//   static Future<void> insertData(String name, int value, double num) async {
//     print("name === > $name");
//     final db = await getDatabase();
//     // INSERT 쿼리 사용
//     await db.rawInsert(
//       'INSERT INTO Test (name, value, num) VALUES (?, ?, ?)',
//       [name, value, num],
//     );
//   }


  // 데이터 조회(함수)
  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await getDatabase();
    return await db.query('Test'); // 'Test' 테이블의 모든 데이터를 조회
  }

  // 데이터 조회(쿼리)
  // static Future<List<Map<String, dynamic>>> getData() async {
  //   final db = await getDatabase();
  //   // SELECT 쿼리 사용
  //   return await db.rawQuery('SELECT * FROM Test');
  // }

  // 데이터 업데이트(함수)
  static Future<int> updateData(int id, String name, int value) async {
    final db = await getDatabase();
    return await db.update('Test', {'name': name, 'value': value},
        where: 'id = ?', whereArgs: [id]);
  }

  // 데이터 업데이트(쿼리)

  // static Future<int> updateData(int id, String name, int value) async {
  //   final db = await getDatabase();
  //   // UPDATE 쿼리 사용
  //   return await db.rawUpdate(
  //     'UPDATE Test SET name = ?, value = ? WHERE id = ?',
  //     [name, value, id],
  //   );
  // }

  // 데이터 삭제(함수)
  static Future<int> deleteData(int id) async {
    final db = await getDatabase();
    return await db.delete('Test', where: 'id = ?', whereArgs: [id]);
  }

// 데이터 삭제(쿼리)
// static Future<int> deleteData(int id) async {
//   final db = await getDatabase();
//   // DELETE 쿼리 사용
//   return await db.rawDelete(
//     'DELETE FROM Test WHERE id = ?',
//     [id],
//   );
// }
}