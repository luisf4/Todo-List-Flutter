import 'package:sqflite/sqflite.dart';

import '../models/task.model.dart';

class TaskController {

  Future<Database> getDatabase() async {
    var path = await getDatabasesPath();
    path += 'tasks.db';

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Task (id INTEGER PRIMARY KEY autoincrement, name TEXT, finished INTEGER)');
    });

    return database;
  }

  Future<void> create(Task task) async {
    var database = await getDatabase();
    await database.insert('Task', task.toMap());
    await database.close();
  }

  Future<List<Map>> read() async{
    var database = await getDatabase();
    List<Map> tasks = await database.rawQuery('SELECT * FROM Task');
    await database.close();
    return tasks;
  }

  Future<void> update(Task task) async {
    var database = await getDatabase();
    await database.update('Task', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
    await database.close();
  }

  Future<void> delete(Task task) async {
    var database = await getDatabase();
    await database.delete('Task', where: 'id = ?', whereArgs: [task.id]);
    await database.close();
  }
}
