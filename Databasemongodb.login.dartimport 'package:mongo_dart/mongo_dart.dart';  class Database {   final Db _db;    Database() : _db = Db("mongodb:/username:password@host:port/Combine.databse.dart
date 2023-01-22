import 'package:mongo_dart/mongo_dart.dart';

class Database {
  final Db _db;

  Database() : _db = Db("mongodb://username:password@host:port/database_name");

  Future<void> connect() async {
    await _db.open();
    await _db.authenticate("username", "password");
  }

  Future<void> insertUser(Map data) async {
    await _db.collection('user').insert(data);
  }

  Future<Map> getUser(String email) async {
    var user = await _db.collection('user').findOne({'email': email});
    return user;
  }

  Future<void> close() async {
    await _db.close();
  }
}
``
