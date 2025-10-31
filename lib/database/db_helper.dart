import 'package:edusmart/model/student_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const tableStudent = 'students';
  static const tableSubjects = 'subjects';
  static const tableGrades = 'grades';
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'ppkd.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tableStudent(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, class TEXT, age int, password TEXT, no_telp TEXT, alamat TEXT, tanggal_lahir TEXT, nama_ortu TEXT, kontak_ortu TEXT )",
        );
        await db.execute('''
          CREATE TABLE $tableSubjects(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE $tableGrades(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            student_id INTEGER NOT NULL,
            subject_id INTEGER NOT NULL,
            type TEXT NOT NULL,
            score REAL NOT NULL,
            FOREIGN KEY(student_id) REFERENCES $tableStudent(id) ON DELETE CASCADE,
            FOREIGN KEY(subject_id) REFERENCES $tableSubjects(id) ON DELETE CASCADE
          )
        ''');
      },
      version: 1,
    );
  }

  static Future<void> registerUser(StudentModel user) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.insert(
      tableStudent,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(user.toMap());
  }

  static Future<StudentModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    //query adalah fungsi untuk menampilkan data (READ)
    final List<Map<String, dynamic>> results = await dbs.query(
      tableStudent,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return StudentModel.fromMap(results.first);
    }
    return null;
  }

  //GET SISWA
  static Future<List<StudentModel>> getAllStudent() async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(tableStudent);
    print(results.map((e) => StudentModel.fromMap(e)).toList());
    return results.map((e) => StudentModel.fromMap(e)).toList();
  }

  //UPDATE SISWA
  static Future<void> updateStudent(StudentModel student) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.update(
      tableStudent,
      student.toMap(),
      where: "id = ?",
      whereArgs: [student.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(student.toMap());
  }

  //DELETE SISWA
  static Future<void> deleteStudent(int id) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.delete(tableStudent, where: "id = ?", whereArgs: [id]);
  }

  //Ambil Nama siswa
  static Future<StudentModel?> getStudentByName(String name) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      tableStudent,
      where: 'name = ?',
      whereArgs: [name],
    );

    if (results.isNotEmpty) {
      return StudentModel.fromMap(results.first);
    }
    return null;
  }

  // CRUD SUBJECTS
  static Future<void> insertSubject(Map<String, dynamic> subject) async {
    final dbs = await db();
    await dbs.insert(
      tableSubjects,
      subject,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getAllSubjects() async {
    final dbs = await db();
    return await dbs.query(tableSubjects);
  }

  static Future<void> updateSubject(
    int id,
    Map<String, dynamic> subject,
  ) async {
    final dbs = await db();
    await dbs.update(tableSubjects, subject, where: "id = ?", whereArgs: [id]);
  }

  static Future<void> deleteSubject(int id) async {
    final dbs = await db();
    await dbs.delete(tableSubjects, where: "id = ?", whereArgs: [id]);
  }

  // CRUD GRADES

  static Future<List<Map<String, dynamic>>> getAllGrades() async {
    final dbs = await db();
    return await dbs.rawQuery('''
    SELECT g.id, g.type, g.score, s.name AS subject_name
    FROM $tableGrades g
    JOIN $tableSubjects s ON g.subject_id = s.id
  ''');
  }

  static Future<void> insertGrade(Map<String, dynamic> grade) async {
    final dbs = await db();
    await dbs.insert(
      tableGrades,
      grade,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getGradesByStudent(
    int studentId,
  ) async {
    final dbs = await db();
    return await dbs.query(
      tableGrades,
      where: "student_id = ?",
      whereArgs: [studentId],
    );
  }

  static Future<void> updateGrade(int id, Map<String, dynamic> grade) async {
    final dbs = await db();
    await dbs.update(tableGrades, grade, where: "id = ?", whereArgs: [id]);
  }

  static Future<void> deleteGrade(int id) async {
    final dbs = await db();
    await dbs.delete(tableGrades, where: "id = ?", whereArgs: [id]);
  }
}
