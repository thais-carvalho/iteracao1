import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaInicio extends StatefulWidget {
  const TelaInicio({ Key? key }) : super(key: key);

  @override
  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Página inicial"),
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
              RaisedButton(
                child: Text("Aluno", style: TextStyle(color: Colors.white, fontSize: 18),),
                elevation: 0,
                color: Color(0xff1620f5),
                onPressed: (){},
              ),
              SizedBox(height: 30,),
              RaisedButton(
                child: Text("Professor", style: TextStyle(color: Colors.white, fontSize: 18),),
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