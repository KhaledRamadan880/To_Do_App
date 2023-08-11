import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';

class SqlFLiteHelper {
  late Database db;

  //! Initial DataBase
  void initDB() async {
    db = await openDatabase(
      'TODO',
      version: 1,
      onOpen: (db) => print('Db opened'),
      onCreate: (Database db, int v) async {
        await db.execute('''
          CREATE TABLE DATA(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            note TEXT,
            date TEXT,
            startTime TEXT,
            endTime TEXT,
            color INTEGER,
            complete INTEGER
          )
        ''').then((value) => print('DB created successfully'));
      },
    );
  }

  //! Get
  Future<List<Map<String, Object?>>> getFromDB() async {
    return await db.rawQuery('''
      SELECT * FROM DATA
    ''');
  }

  //! Insert
  Future<int> insertToDb(TaskModel model) async {
    return await db.rawInsert('''
      INSERT INTO DATA(
        title, note, date, startTime, endTime, color, complete
      )
      VALUES(
        '${model.title}', '${model.note}', '${model.date}',
         '${model.startTime}', '${model.endTime}', 
         '${model.color}', '${model.complete}'
      )
    ''');
  }

  //! Update
  Future<int> updateDB(int id) async {
    return await db.rawUpdate('''
      UPDATE DATA
      SET complete = ?
      WHERE id = ?
    ''', [1, id]);
  }

  //! Delete
  deleteFromDB(int id) async {
    await db.rawDelete('''
      DELETE FROM DATA
      WHERE id = ?      
    ''', [id]);
  }
}
