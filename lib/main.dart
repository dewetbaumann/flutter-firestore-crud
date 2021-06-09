import 'package:firebase_demo/ui/create.dart';
import 'package:firebase_demo/ui/delete.dart';
import 'package:firebase_demo/ui/read.dart';
import 'package:firebase_demo/ui/update.dart';
import 'package:flutter/material.dart';

import 'ui/crud.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

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
      },
    );
  }
}
