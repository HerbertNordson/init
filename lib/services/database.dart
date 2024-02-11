import 'package:init/controllers/todo_dao_controller.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'todo.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TodoDao.tableSql);
    },
    version: 1,
  );
}
