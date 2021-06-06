import 'package:flutter/material.dart';
import 'package:iteracao1/pages/grade_crud_page.dart';
import 'package:iteracao1/pages/student_crud_page.dart';
import 'package:iteracao1/models/student_model.dart';
import 'dart:io';
class ListagemDeAluno extends StatefulWidget {

  @override
  _ListagemDeAlunoState createState() => _ListagemDeAlunoState();
}

class _ListagemDeAlunoState extends State<ListagemDeAluno> {
  List<Student> students = List();

  StudentHelper helper = StudentHelper();

  @override
  void initState() {
    super.initState();

    _getAllStudents();

    Student s = Student();
    s.name = "Fulano";
    s.email = "fula@mail.com";
    s.pass = "asdf";
    s.n1 = 13;
    helper.saveStudent(s);

    helper.getAllStudents().then((list)
    {
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        elevation: 0,
        title: Text("Listagem de aluno"),
        centerTitle: true,
        backgroundColor: Color(0xff1620f5),
      ),
      floatingActionButton: FloatingActionButton
      (
        onPressed: () async
        {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroAlunoTela()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder
      (
        padding: EdgeInsets.all(10),
        itemCount: students.length,
        itemBuilder: (context, index)
        {
          return _studentCard(context, index);
        },
      ),
      
    );
  }
  Widget _studentCard(BuildContext context, int index)
  {
    return GestureDetector
    (
      child: Card
      (
        child: Padding
        (
          padding: EdgeInsets.all(10.0),
          child: Row
          (
            children:
            [
              Container
              (
                width: 80.0,
                height: 80.0,
              ),
              Padding
              (
                padding: EdgeInsets.only(left: 10.0),
                child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: 
                  [
                    Text
                    (
                      students[index].name,
                      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)
                    ),
                    Text
                    (
                      students[index].email ?? "",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text
                    (
                      students[index].n1 ?? "",
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () async
      {
        final selecStudent = await Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroDeNotas(student: students[index])));
        helper.saveStudent(selecStudent);
        _getAllStudents();
      },
    );
  }

  void _getAllStudents()
  {
    StudentHelper instance = StudentHelper();
    instance.getAllStudents().then((list)
    {
      setState(()
      {
        students = list;
      });
    });
  }
}