import 'package:mongo_dart/mongo_dart.dart';

class Database {
  final Db _db;

  Database() : _db = Db("mongodb://username:password@host:port/database_name");

  Future<void> connect() async {
    await _db.open();
  }

  Future<void> updateUser(String email, Map data) async {
    await _db.collection('user').update({'email': email}, data);
  }

  Future<void> close() async {
    await _db.close();
  }
}
