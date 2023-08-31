import 'package:flutter/services.dart';
import 'package:flutter_ujikom_test_2/data/local/sqflite/database.dart';
import 'package:flutter_ujikom_test_2/model/pemilih.dart';
import 'package:sqflite/sqflite.dart';

class TodoDB{
  final tableName = 'pemilih';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL,
      "nik" TEXT NOT NULL,
      "name" TEXT NOT NULL,
      "phone" TEXT NOT NULL,
      "gender" TEXT NOT NULL,
      "date" TEXT NOT NULL,
      "address" TEXT NOT NULL,
      "lat_address" TEXT NOT NULL,
      "lng_address" TEXT NOT NULL,
      "picture" TEXT NOT NULL,
      "picture_path" TEXT NOT NULL,
      PRIMARY KEY ("id" AUTOINCREMENT)
    );""");
  }

  Future<int> create({required Pemilih data}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (nik, name, phone, gender, date, address, lat_address, lng_address, picture, picture_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
      [data.nik, data.name, data.phone, data.gender, data.date, data.address, data.latAddress, data.lngAddres, data.picture, data.picturePath],
    );
  }

  Future<List<Pemilih>> fetchAll() async {
    final database = await DatabaseService().database;
    final datas = await database.rawQuery(
      '''SELECT * FROM $tableName'''
    );
    return datas.map((value) => Pemilih.fromSqfliteDatabase(value)).toList();
  }

  Future<Pemilih> fetchById(int id) async {
    final database = await DatabaseService().database;
    final datas = await database.rawQuery(
      '''SELECT * FROM $tableName WHERE id = ?''', 
      [id]
    );
    return Pemilih.fromSqfliteDatabase(datas.first);
  }

  Future<int> updateData({required int id, Pemilih? dataUpdate}) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate(
      '''UPDATE $tableName SET 
      nik = ?, name = ?, phone = ?, gender = ?, date = ?, address = ?, lat_address = ?, lng_address = ?, picture = ?, picture_path = ? 
      WHERE id = ?''',
      [dataUpdate?.nik ?? '', dataUpdate?.name ?? '', dataUpdate?.phone ?? '', dataUpdate?.gender ?? '', dataUpdate?.date ?? '', dataUpdate?.address ?? '', dataUpdate?.latAddress ?? '', dataUpdate?.lngAddres ?? '', dataUpdate?.picture ?? '', dataUpdate?.picturePath ?? '', id],
    );
  }

  Future<void> delete (int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''DELETE FROM $tableName WHERE id = ?''', [id]);
  }
}