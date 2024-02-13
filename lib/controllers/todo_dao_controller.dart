import 'package:init/models/todo_model.dart';
import 'package:init/services/database.dart';
import 'package:sqflite/sqflite.dart';

class TodoDao {
  static const String tableSql = 'CREATE TABLE todos'
      '$_id INTEGER PRIMARY KEY, '
      '$_todo String, '
      '$_details String, $_done boolean)';

  static const String _id = 'id';
  static const String _todo = 'todo';
  static const String _details = 'details';
  static const String _done = 'done';

  Future create(Todo model) async {
    try {
      final Database db = await getDatabase();

      await db.insert(
        'todos',
        model.toMap(),
      );
    } catch (err) {
      print(err);
      return;
    }
  }

  Future<List<Todo>> getTodos() async {
    try {
      final Database db = await getDatabase();
      final List<Map<String, dynamic>> maps = await db.query('todos');

      return List.generate(
        maps.length,
        (i) {
          return Todo(
              id: maps[i]['id'],
              todo: maps[i]['todo'],
              details: maps[i]['details'],
              done: maps[i]['done']);
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  Future<List<Todo>> search(String term) async {
    try {
      final Database db = await getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        'todos',
        where: "name LIKE ?",
        whereArgs: [
          '%$term%',
        ],
      );

      return List.generate(
        maps.length,
        (i) {
          return Todo(
            id: maps[i]['id'],
            todo: maps[i]['todo'],
            details: maps[i]['details'],
            done: maps[i]['done'],
          );
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  Future<Todo> getTodo(int id) async {
    try {
      final Database db = await getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        'todos',
        where: "id = ?",
        whereArgs: [id],
      );

      return Todo(
        id: maps.first['id'],
        todo: maps.first['todo'],
        details: maps.first['details'],
        done: maps.first['done'],
      );
    } catch (ex) {
      print(ex);
      return new Todo();
    }
  }

  Future update(Todo model) async {
    try {
      final Database db = await getDatabase();

      await db.update(
        'todos',
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future delete(int id) async {
    try {
      final Database db = await getDatabase();
      await db.delete(
        'todos',
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future updateDetails(int id, String detail) async {
    try {
      final Database db = await getDatabase();
      final model = await getTodo(id);

      model.details = detail;

      await db.update(
        'todos',
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future updateDone(int id, bool done) async {
    try {
      final Database db = await getDatabase();
      final model = await getTodo(id);

      model.done = done;

      await db.update(
        'todos',
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
