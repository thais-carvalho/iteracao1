import 'package:flutter/material.dart';
import 'package:iteracao1/models/student_model.dart';
class CadastroDeNotas extends StatefulWidget {

  final Student student;

  CadastroDeNotas({this.student});

  @override
  _CadastroDeNotasState createState() => _CadastroDeNotasState();
}

class _CadastroDeNotasState extends State<CadastroDeNotas> {
  Student _student;

  final _n1Controller = TextEditingController();
  final _n2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
      _student = Student.fromMap(widget.student.toMap());

      _n1Controller.text = _student.n1.toString();
      _n2Controller.text = _student.n2.toString();
    
  }

   TextEditingController inputUsuario = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        elevation: 0,
        title: Text("Cadastro de Notas"),
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
                onPressed: ()
                {
                  Navigator.pop(context, _student);
                },
              ),
            ],
          ) ,
        ),
      ),
      
    );
  }
}