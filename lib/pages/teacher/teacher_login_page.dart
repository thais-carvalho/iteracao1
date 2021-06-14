import 'package:flutter/material.dart';
import 'package:iteracao1/pages/students/student_list_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginProfessorTela extends StatefulWidget {
  @override
  _LoginProfessorTelaState createState() => _LoginProfessorTelaState();
}

class _LoginProfessorTelaState extends State<LoginProfessorTela> {
  final _nameController = TextEditingController();
  final _passController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String email, password;

  Future _register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: 'professor@mail.com', password: '123456789');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(
            'senha muito fraca'); //UMA SUGESTÃO SERIA MOSTRAR PARA O USUÁRIO AO INVÉS DE PRINTAR NO CONSOLE
      } else if (e.code == 'email-already-in-use') {
        print(
            'email já existe'); //UMA SUGESTÃO SERIA MOSTRAR PARA O USUÁRIO AO INVÉS DE PRINTAR NO CONSOLE
      }
    } catch (e) {
      print(e);
    }
  }

  Future _login() async {
    setState(() {
      email = _nameController.text;
      password = _passController.text;
      _nameController.text = "";
      _passController.text = "";
    });

    try {
      //UMA SUGESTÃO SERIA CRIAR ALGUMA VARIÁVEL PARA CONTROLE DE USUÁRIO, JÁ QUE ESTÁ SENDO POSSÍVEL LOGAR COM AMBOS OS TIPOS NAS DUAS OPÇÕES
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListagemDeAluno()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(
            'email errado'); //UMA SUGESTÃO SERIA MOSTRAR PARA O USUÁRIO AO INVÉS DE PRINTAR NO CONSOLE
      } else if (e.code == 'wrong-password') {
        print(
            'Senha errada'); //UMA SUGESTÃO SERIA MOSTRAR PARA O USUÁRIO AO INVÉS DE PRINTAR NO CONSOLE
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Portal do professor"),
        centerTitle: true,
        backgroundColor: Color(0xff1620f5),
      ),
      backgroundColor: Color(0xff0a95fa),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(color: Color(0xff0a95fa)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        filled: true,
                        hintText: "Usuário:"),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: _passController,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        filled: true,
                        hintText: "Senha:"),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                RaisedButton(
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  elevation: 0,
                  color: Color(0xff1620f5),
                  onPressed: _login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
