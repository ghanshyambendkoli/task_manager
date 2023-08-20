
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_manager/model/task_model.dart';


class SqliteDatabaseHelper{

final String _tableName = "task";

  Future<Database> getDataBase() async {
    return openDatabase(
      join(await getDatabasesPath(), "taskDatabase.db"),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, name TEXT, dueDate TEXT, category TEXT)",
        );
      },
      version: 1,
    );
  }
  Future<int> insertTask(Task task) async {
    int userId = 0;
    Database db = await getDataBase();
    await db.insert( _tableName, task.toJson()).then((value) {
      userId = value;
    });
    return userId;
  }

  Future<List<Task>> getAllTask() async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> taskMap = await db.query(_tableName);
    return List.generate(taskMap.length, (index) {
      return Task(
          id: taskMap[index]["id"],
          name: taskMap[index]["name"],
          dueDate: taskMap[index]["dueDate"],
          category: taskMap[index]["category"],
          );
    });
  }
  Future<void> deleteTask() async {
    Database db = await getDataBase();
    await db.rawDelete("DELETE FROM $_tableName");
  }

}
