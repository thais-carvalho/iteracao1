import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iteracao1/pages/students/student_list_page.dart';

class CadastroAlunoTela extends StatefulWidget {

  @override
  _CadastroAlunoTelaState createState() => _CadastroAlunoTelaState();
}

class _CadastroAlunoTelaState extends State<CadastroAlunoTela> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String nome, email, password;
  void _addData(String name, String email){
    var firebaseUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('alunos').doc(firebaseUser.uid).set({
      'nome': name,
      'email': email,
    }).then((value) => print('adicionado'));
  }

  Future _register() async{

    setState(() {
      nome = _nameController.text;
      email = _emailController.text;
      password = _passController.text;
    });

    if(_passController.text != _confirmController.text){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('As senha não são parecidas'),));
    }else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
        );

       _addData(nome, email);

        Navigator.push(context, MaterialPageRoute(builder: (context) => ListagemDeAluno()));

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('senha muito fraca');
        } else if (e.code == 'email-already-in-use') {
          print('email já existe');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Cadastro de alunos"),
        centerTitle: true,
        backgroundColor: Color(0xff1620f5),
      ),
      body: SingleChildScrollView(
          child: Container (
          decoration: BoxDecoration(
            color: Color(0xff0a95fa)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cadastrar", style: TextStyle(color: Colors.white, fontSize: 30)),
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
                  onPressed: _register,
                ),
              ],
            ) ,
          ),
        ),
      ),
      
    );
  }
}