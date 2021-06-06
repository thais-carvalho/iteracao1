import 'package:flutter/material.dart';
import 'package:iteracao1/pages/student_crud_page.dart';
class ListagemDeAluno extends StatefulWidget {
  const ListagemDeAluno({ Key? key }) : super(key: key);

  @override
  _ListagemDeAlunoState createState() => _ListagemDeAlunoState();
}

class _ListagemDeAlunoState extends State<ListagemDeAluno> {
  TextEditingController inputUsuario = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
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
      body: Container (
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          color: Color(0xff0a95fa)
        ),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(),
              DataTable(
                columns: [
                  DataColumn(label: Text("Nome:")),
                  DataColumn(label: Text("Nota 1:")),
                  DataColumn(label: Text("Nota 2:")),
                  DataColumn(label: Icon(Icons.edit))
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text("nalberty")),
                      DataCell(Text("8")),
                      DataCell(Text("10")),
                      DataCell(Icon(Icons.edit)),  
                    ]
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("nalberty")),
                      DataCell(Text("8")),
                      DataCell(Text("10")),
                      DataCell(Icon(Icons.edit)),  
                    ]
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("nalberty")),
                      DataCell(Text("8")),
                      DataCell(Text("10")),
                      DataCell(Icon(Icons.edit)),  
                    ]
                  ),
                ],
              )
            ],
          ) ,
        ),
      ),
      
    );
  }
}