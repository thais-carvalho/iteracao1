import 'package:flutter/material.dart';
import 'package:iteracao1/pages/grade_check_page.dart';
class LoginAlunoTela extends StatefulWidget {

  @override
  _LoginAlunoTelaState createState() => _LoginAlunoTelaState();
}

class _LoginAlunoTelaState extends State<LoginAlunoTela> {
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Portal do aluno"),
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
              Text("Login", style: TextStyle(color: Colors.white, fontSize: 30)),
              SizedBox(height: 0, ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(fillColor: Colors.white, border: OutlineInputBorder(), filled: true, hintText: "Usuário:"),
                  ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                    controller: _passController,
                    decoration: InputDecoration(fillColor: Colors.white, border: OutlineInputBorder(), filled: true, hintText: "Senha:"),
                  ),
              ),
              SizedBox(height: 90,),
              RaisedButton(
                child: Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 25),),
                elevation: 0,
                color: Color(0xff1620f5),
                onPressed: () async
                {
                  await Navigator.push(context, MaterialPageRoute(builder: (context) => PortalDoAluno()));
                },
              ),
            ],
          ) ,
        ),
      ),
      
    );
  }
}