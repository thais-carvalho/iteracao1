import 'package:flutter/material.dart';
import 'package:iteracao1/pages/grade_crud_page.dart';
import 'package:iteracao1/pages/home_page.dart';
import 'package:iteracao1/pages/students/student_crud_page.dart';
import 'package:iteracao1/models/student_model.dart';
import 'package:iteracao1/pages/grade_crud_page.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ListagemDeAluno extends StatefulWidget {

  @override
  _ListagemDeAlunoState createState() => _ListagemDeAlunoState();
}

class _ListagemDeAlunoState extends State<ListagemDeAluno> {

  Future _signOut() async {
    await FirebaseAuth.instance.signOut();
    print('Deslogado');
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TelaInicio()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _signOut, 
          icon: Icon(Icons.arrow_back)
        ),
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
      body: StudentsCard(),
      
    );
  }
}

class StudentsCard extends StatefulWidget {
  @override
  _StudentsCardState createState() => _StudentsCardState();
}

class _StudentsCardState extends State<StudentsCard> {

  String alunoUid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('alunos').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          print('error');
          return Text('error');
        } else if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: getItens(snapshot),
        );
      },  
    );
  }

  getItens(AsyncSnapshot<QuerySnapshot> snapshot){
    return snapshot.data.docs.map((doc) => 
      GestureDetector(
        onTap: (){
          setState(() {
            alunoUid = doc.id;
          });
          print(alunoUid);
          Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroDeNotas(alunoUid)));
        },
        child: Card(
          child: ListTile(
            title: Text(doc['nome']),
            subtitle: Text(doc['email']),
          ),
    ),
      )).toList();
  }
}