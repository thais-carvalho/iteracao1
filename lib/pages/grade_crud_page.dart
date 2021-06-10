import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iteracao1/models/student_model.dart';
import 'package:iteracao1/pages/students/student_list_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroDeNotas extends StatefulWidget {

  //final Student student;
  String alunoUid;

  CadastroDeNotas(this.alunoUid);

  @override
  _CadastroDeNotasState createState() => _CadastroDeNotasState();
}

class _CadastroDeNotasState extends State<CadastroDeNotas> {
  Student _student;


  final _n1Controller = TextEditingController();
  final _n2Controller = TextEditingController();

  String nota1, nota2, uid;
  Future _addNotas(){
    setState(() {
      nota1 = _n1Controller.text;
      nota2 = _n2Controller.text;
    });

    CollectionReference aluno = FirebaseFirestore.instance.collection('alunos');

    aluno.doc(widget.alunoUid).update({'nota 01': nota1, 'nota 02': nota2})
          .then((value) => print('Notas atualizadas'))
          .catchError((error) => print('Error: $error'));

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ListagemDeAluno()));

  }


   TextEditingController inputUsuario = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ListagemDeAluno()));
          }, 
          icon: Icon(Icons.arrow_back)
        ),
        elevation: 0,
        title: Text("Cadastro de Notas"),
        centerTitle: true,
        backgroundColor: Color(0xff1620f5),
      ),
      body: SingleChildScrollView(
        child: Container (
          padding: EdgeInsets.only(bottom: 150),
          decoration: BoxDecoration(
            color: Color(0xff0a95fa)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Nome do Aluno", style: TextStyle(color: Colors.white, fontSize: 30)),
                SizedBox(height: 30, ),
                Padding(
                  padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                  child: TextField(
                      controller: _n1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(fillColor: Colors.white, border: OutlineInputBorder(), filled: true, hintText: "Nota 1:"),
                    ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                  child: TextField(
                      controller: _n2Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(fillColor: Colors.white, border: OutlineInputBorder(), filled: true, hintText: "Nota 2:"),
                    ),
                ),
                SizedBox(height: 90,),
                RaisedButton(
                  child: Text("Salvar", style: TextStyle(color: Colors.white, fontSize: 25),),
                  elevation: 0,
                  color: Color(0xff1620f5),
                  onPressed: _addNotas,
                ),
              ],
            ) ,
          ),
        ),
      ),
      
    );
  }
}