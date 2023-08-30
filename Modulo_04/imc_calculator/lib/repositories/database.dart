// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: ''' CREATE TABLE pessoa (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    peso REAL,
    altura REAL
    );''',
  2: ''' CREATE TABLE imc (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    imc REAL,
    categoria TEXT,
    peso REAL,
    altura REAL,
    id_pessoa INTEGER,
    data_calculo DATETIME,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id) ON DELETE NO ACTION ON UPDATE NO ACTION
    );''',
};

class SqliteDataBase {
  static Database? db;

  Future<Database> getDatabase() async {
    if (db == null) {
      return await iniciarDataBase();
    } else {
      return db!;
    }
  }

  Future<Database> iniciarDataBase() async {
    var db = await openDatabase(
      path.join(await getDatabasesPath(), 'database_im_calculator'),
      version: scripts.length,
      onCreate: (Database db, int version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
    );

    return db;
  }
}
