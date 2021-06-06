import 'package:flutter/material.dart';
class CadastroDeNotas extends StatefulWidget {
  const CadastroDeNotas({ Key? key }) : super(key: key);

  @override
  _CadastroDeNotasState createState() => _CadastroDeNotasState();
}

class _CadastroDeNotasState extends State<CadastroDeNotas> {
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
                    controller: inputUsuario,
                    decoration: InputDecoration(fillColor: Colors.white, border: OutlineInputBorder(), filled: true, hintText: "Nota 1:"),
                  ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                child: TextField(
                    controller: inputUsuario,
                    decoration: InputDecoration(fillColor: Colors.white, border: OutlineInputBorder(), filled: true, hintText: "Nota 2:"),
                  ),
              ),
              SizedBox(height: 90,),
              RaisedButton(
                child: Text("Salvar", style: TextStyle(color: Colors.white, fontSize: 25),),
                elevation: 0,
                color: Color(0xff1620f5),
                onPressed: (){},
              ),
            ],
          ) ,
        ),
      ),
      
    );
  }
}