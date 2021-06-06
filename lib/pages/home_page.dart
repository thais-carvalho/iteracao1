import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iteracao1/pages/teacher_login_page.dart';
import 'package:iteracao1/pages/student_login_page.dart';

class TelaInicio extends StatefulWidget {

  @override
  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Página inicial"),
        centerTitle: true,
        backgroundColor: Color(0xff1620f5),
      ),
      body: Container (
        decoration: BoxDecoration(
          color: Color(0xff0a95fa)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("Aluno", style: TextStyle(color: Colors.white, fontSize: 18),),
                elevation: 0,
                color: Color(0xff1620f5),
                onPressed: () async
                {
                  await Navigator.push(context, MaterialPageRoute(builder: (context) => LoginAlunoTela()));

                },
              ),
              SizedBox(height: 30,),
              RaisedButton(
                child: Text("Professor", style: TextStyle(color: Colors.white, fontSize: 18),),
                elevation: 0,
                color: Color(0xff1620f5),
                onPressed: () async
                {
                  await Navigator.push(context, MaterialPageRoute(builder: (context) => LoginProfessorTela()));
                },
              ),
            ],
          ) ,
        ),
      ),
    );
  }
}