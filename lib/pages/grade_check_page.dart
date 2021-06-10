import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';

class PortalDoAluno extends StatefulWidget {

  @override
  _PortalDoAlunoState createState() => _PortalDoAlunoState();
}

class _PortalDoAlunoState extends State<PortalDoAluno> {

  Future _signOut() async {
    await FirebaseAuth.instance.signOut();
    print('Deslogado');
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TelaInicio()));
  }

  final _firebaseUser = FirebaseAuth.instance.currentUser;

  Map<String, dynamic> data;
  Future<DocumentSnapshot> _getData() async{
    CollectionReference userReference = FirebaseFirestore.instance.collection('alunos');
    DocumentSnapshot snapshot = await userReference.doc(_firebaseUser.uid).get();
    return snapshot;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
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

              FutureBuilder(
                future: _getData(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                  if(snapshot.hasData && !snapshot.data.exists){
                    return Text('Error');
                  }else if(snapshot.connectionState == ConnectionState.done){
                    Map<String, dynamic> data = snapshot.data.data();
                    double media, n1, n2;
                    n1 = double.parse(data['nota 01']);
                    n2 = double.parse(data['nota 02']);

                    media = (n1 + n2) / 2;

                    return Column(
                      children: [

                        Text("${data['nome']}", style: TextStyle(color: Colors.white, fontSize: 30)),
                        SizedBox(height: 30, ),
                        SizedBox(height: 15,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Nota 1:", style: TextStyle(color: Colors.white, fontSize: 25)),
                            SizedBox(width: 10,),
                            Text("${data['nota 01']}", style: TextStyle(color: Colors.white, fontSize: 25)),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Nota 2:", style: TextStyle(color: Colors.white, fontSize: 25)),
                            SizedBox(width: 10,),
                            Text("${data['nota 02']}", style: TextStyle(color: Colors.white, fontSize: 25)),
                          ],
                        ),
                        SizedBox(height: 45,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Média:", style: TextStyle(color: Colors.white, fontSize: 25)),
                            SizedBox(width: 10,),
                            Text("${media.toStringAsPrecision(2)}", style: TextStyle(color: Colors.white, fontSize: 25)),
                          ],
                        ),
                      ]
                    );

                  }else{
                    print(_firebaseUser.uid);
                    return Center(child: CircularProgressIndicator(),);            
                  }
                },
              ),

            ],
          ) ,
        ),
      ),
      
    );
  }

}