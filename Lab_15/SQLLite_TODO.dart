import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBaseDemo {
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.path, 'cureoption.db');
    var db = await openDatabase(path, onCreate: (db, version) async {
      await db.execute('''
          create table State(
           state_id INTEGER PRIMARY KEY AUTOINCREMENT,
           state_name TEXT NOT NULL
          )''');
      await db.execute('''
          create table City(
           city_id INTEGER PRIMARY KEY AUTOINCREMENT,
           city_name TEXT NOT NULL,
           state_id INTEGER NOT NULL,
           FOREIGN KEY (state_id) REFERENCES State(state_id)
          )
        ''');
    }, onUpgrade: (db, oldVersion, newVersion) {}, version: 1);
    return db;
  }

  Future<void> selectAllState() async{
    Database db = await initDatabase();
    // List<Map<String,dynamic>> states = await db.query("State");
    List<Map<String,dynamic>> states = await db.rawQuery("select * from State");
    print(states);
  }

  Future<void> insertState() async{
    Database db = await initDatabase();
    int id =  await db.insert("State", {"state_name" : "abc"});
    print("id $id");
  }

}
