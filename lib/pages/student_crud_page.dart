import 'package:flutter/material.dart';
class CadastroAlunoTela extends StatefulWidget {

  @override
  _CadastroAlunoTelaState createState() => _CadastroAlunoTelaState();
}

class _CadastroAlunoTelaState extends State<CadastroAlunoTela> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        elevation: 0,
        title: Text("Cadastro de alunos"),
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
                    decoration: InputDecoration(fillColor: Colors.white, border: OutlineInputBorder(), filled: true, hintText: "Nome completo:"),
                  ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(fillColor: Colors.white, border: OutlineInputBorder(), filled: true, hintText: "Email:"),
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
               SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                    controller: _confirmController,
                    decoration: InputDecoration(fillColor: Colors.white, border: OutlineInputBorder(), filled: true, hintText: "Confirmação de senha:"),
                  ),
              ),
              SizedBox(height: 90,),
              RaisedButton(
                child: Text("Cadastrar", style: TextStyle(color: Colors.white, fontSize: 25),),
                elevation: 0,
                color: Color(0xff1620f5),
                onPressed: ()
                {
                  Navigator.pop(context);
                },
              ),
            ],
          ) ,
        ),
      ),
      
    );
  }
}