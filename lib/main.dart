import 'package:flutter/material.dart';
import 'package:iteracao1/pages/home_page.dart';
import 'package:iteracao1/pages/students/student_list_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Interação 01",
      home: TelaInicio(),
    );
  }
}