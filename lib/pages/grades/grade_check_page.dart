import 'package:flutter/material.dart';
class PortalDoAluno extends StatefulWidget {

  @override
  _PortalDoAlunoState createState() => _PortalDoAlunoState();
}

class _PortalDoAlunoState extends State<PortalDoAluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Text("Nome do Aluno", style: TextStyle(color: Colors.white, fontSize: 30)),
              SizedBox(height: 30, ),
               SizedBox(height: 15,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nota 1:", style: TextStyle(color: Colors.white, fontSize: 25)),
                  SizedBox(width: 10,),
                  Text("8", style: TextStyle(color: Colors.white, fontSize: 25)),
                ],
              ),
              SizedBox(height: 15,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nota 2:", style: TextStyle(color: Colors.white, fontSize: 25)),
                  SizedBox(width: 10,),
                  Text("10", style: TextStyle(color: Colors.white, fontSize: 25)),
                ],
              ),
              SizedBox(height: 45,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Média:", style: TextStyle(color: Colors.white, fontSize: 25)),
                  SizedBox(width: 10,),
                  Text("9", style: TextStyle(color: Colors.white, fontSize: 25)),
                ],
              ),
            ],
          ) ,
        ),
      ),
      
    );
  }
}