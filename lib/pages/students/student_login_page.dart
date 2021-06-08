import 'package:flutter/material.dart';
import 'package:iteracao1/pages/grades/grade_check_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginAlunoTela extends StatefulWidget {

  @override
  _LoginAlunoTelaState createState() => _LoginAlunoTelaState();
}

class _LoginAlunoTelaState extends State<LoginAlunoTela> {
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  
  String email, password;
  Future _login() async{

    setState(() {
      email = _nameController.text;
      password = _passController.text;
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => PortalDoAluno()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('email errado');
      } else if (e.code == 'wrong-password') {
        print('Senha errada');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Portal do aluno"),
        centerTitle: true,
        backgroundColor: Color(0xff1620f5),
      ),
      backgroundColor: Color(0xff0a95fa),
      body: SingleChildScrollView(
        child: Container (
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
                  onPressed: _login,
                ),
              ],
            ) ,
          ),
        ),
      ),
      
    );
  }
}