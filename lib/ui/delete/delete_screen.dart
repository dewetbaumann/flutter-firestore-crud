import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteFirestore extends StatelessWidget {
  final fs = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete data from Firestore'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  fs
                      .collection("collectionToDelete")
                      .doc('KyMUxe4UuaesE7ec6MoE')
                      .delete();
                },
                child: Text('Eliminar documentos'),
              ),
              TextButton(
                onPressed: () {
                  fs
                      .collection('collectionToDelete')
                      .doc('document')
                      .update({'fieldToDelete': FieldValue.delete()});

                  fs
                      .collection("collectionToDelete")
                      .doc('KyMUxe4UuaesE7ec6MoE')
                      .delete()
                      .then((_) {
                    print("success!");
                  });
                },
                child: Text('Eliminar campo dentro de un documentos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
