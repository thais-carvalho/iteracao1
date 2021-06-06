import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

final String studentTable = "studentTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String passColumn = "passColumn";
final String n1Column = "n1Column";
final String n2Column = "n2Column";
final String mediaColumn = "mediaColumn";

class StudentHelper
{
  static final StudentHelper _instance = StudentHelper.internal();

  factory StudentHelper() => _instance;

  StudentHelper.internal();

   Database _db;

   Future<Database>get db async
   {
     if (_db != null)
      return _db;
     else
     {
       _db = await initDb();
       return _db;
     }
   }
   Future<Database>initDb() async
   {
     final databasesPath = await getDatabasesPath();
     final path = join(databasesPath, "students.db");

     return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async
     {
       await db.execute("CREATE TABLE $studentTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $passColumn TEXT, $n1Column NUMERIC, $n2Column NUMERIC, $mediaColumn NUMERIC)");
     });
   }

  Future<Student> saveStudent(Student student) async
  {
    Database dbStudent = await db;
    student.id = await dbStudent.insert(studentTable, student.toMap());
    return student;
  }
  Future<Student> getStudent(int id) async
  {
    Database dbStudent = await db;
    List<Map> maps = await dbStudent.query(studentTable, columns: [idColumn, nameColumn, emailColumn, passColumn, n1Column, n2Column, mediaColumn], where: "$idColumn = ?", whereArgs: [id]);
    if(maps.length > 0)
      return Student.fromMap(maps.first);
    else
      return null;
  }
  Future<int> deleteStudent(int id) async
  {
    Database dbStudent = await db;
    return await dbStudent.delete(studentTable, where: "$idColumn = ?", whereArgs: [id]);
  }
  Future<int> updateStudent(Student student) async
  {
    Database dbStudent = await db;
    return await dbStudent.update(studentTable, student.toMap(), where: "$idColumn = ?", whereArgs: [student.id]);
  }
  Future<List> getAllStudents() async
  {
    Database dbStudent = await db;
    List listMap = await dbStudent.rawQuery("SELECT * FROM $studentTable");
    List<Student> listStudent = List();
    for(Map m in listMap)
    {
      listStudent.add(Student.fromMap(m));
    }
    return listStudent;
  }
  Future<int> getNumber() async
  {
    Database dbStudent = await db;
    return Sqflite.firstIntValue(await dbStudent.rawQuery("SELECT COUNT(*) FROM $studentTable"));
  }

  Future close() async
  {
    Database dbStudent = await db;
    dbStudent.close();
  }
}

class Student
{
  int id;
  String name;
  String email;
  String pass;
  double n1;
  double n2;
  double media;

  Student();

  Student.fromMap(Map map)
  {
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    pass = map[passColumn];
    n1 = map[n1Column];
    n2 = map[n2Column];
    media = map[mediaColumn];
  }

  Map toMap ()
  {
    Map<String, dynamic> map = 
    {
      nameColumn: name,
      emailColumn: email,
      passColumn: pass,
      n1Column: n1,
      n2Column: n2,
      mediaColumn: media,
    };
    if (id !=null)
    {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString()
  {
    
    return "Student- id: $id, name: $name, email: $email, phone: $pass, n1: $n1, n2: $n2, media: $media";
  }
}