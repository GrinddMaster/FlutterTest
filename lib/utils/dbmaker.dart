import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'users.dart';

class DatabaseHandler {
  Future<List<User>> listForUsers() async {
    final db = await createDatabase();
    final List<Map<String, dynamic>> userMaps = await db.query('Users');
    return List.generate(userMaps.length, (int row) {
      //generate a list that contains users's info.
      //where (i) is the row, and 'id', etc.. are the column.
      return User(
        id: userMaps[row]['id'],
        name: userMaps[row]['name'],
        age: userMaps[row]['age'],
        address: userMaps[row]['address'],
      );
    });
  }

  Future<Database> createDatabase() async {
    final dpPath = await getDatabasesPath();
    final dataBasePath = join(dpPath, 'test_db.db');

    final dbExist = await databaseExists(dataBasePath);
    if (dbExist) {
      return openDatabase(dataBasePath);
    } else {
      final database =
          openDatabase(join(await getDatabasesPath(), 'test_db.db'),
              onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE Users(id INTEGER PRIMARY KEY,name TEXT,age INTEGER,address TEXT)');
      }, version: 1);
      return database;
    }
  }

  Future<bool> insertUser(User usr) async {
    final db = await createDatabase();
    int id = await db.insert(
      'Users',
      usr.usrMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id != 0;
  }

  Future<int?> getUserCount() async {
    final db = await createDatabase();
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM Users'));
  }

  Future<String> showDbContents() async {
    final db = await createDatabase();
    List<Map<String, dynamic>> test = await db.rawQuery('SELECT * FROM Users');
    return test.toString();
  }

  Future<String> removeUser() async {
    final db = await createDatabase();
    List<Map<String, dynamic>> test =
        await db.rawQuery('DELETE FROM Users WHERE id = 20');
    return test.toString();
  }
}
