import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/ui/create/create_screen.dart';
import 'package:firebase_demo/ui/delete/delete_screen.dart';
import 'package:firebase_demo/ui/read/readFromDocWithFields.dart';
import 'package:firebase_demo/ui/read/readFromDocWithOutFields.dart';
import 'package:firebase_demo/ui/read/read_screen.dart';
import 'package:firebase_demo/ui/update/update_screen.dart';
import 'package:flutter/material.dart';

import 'ui/crud.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print('Base de datos inicializada');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => CrudFireStore(),
        '/create': (context) => CreateFirestore(),
        '/read': (context) => ReadFirestore(),
        '/update': (context) => UpdateFirestore(),
        '/delete': (context) => DeleteFirestore(),
        '/readFromDocsWithFields': (context) => ReadFromDocWithFields(),
        '/readFromDocsWithOutFields': (context) => ReadFromDocWithOutFields(),
      },
    );
  }
}
