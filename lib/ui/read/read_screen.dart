// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/ui/read/readFromDocWithOutFields.dart';
import 'package:flutter/material.dart';

class ReadFirestore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read data from FireStore'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            // Leer datos desde los documentos, conociendo los la coleccion y los campos
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/readFromDocsWithFields');
              },
              child: Text(
                'Leer campos desde los documentos, conociendo la coleccion y los campos',
                textAlign: TextAlign.center,
              ),
            ),

            // Leer datos desde los documentos, sin conocer los campos
            TextButton(
              onPressed: _onPressed2,
              child: Text(
                'Leer campos desde los documentos, sin conocer / conociendo los documentos',
                textAlign: TextAlign.center,
              ),
            ),

            // Leer todos los campos de un docuemtnos dentro de una subcoleccion dentro de un docuemnto en especifico
            TextButton(
              onPressed: _onPressed3,
              child: Text(
                'Leer todos los campos de un documento dentro de una subcoleccion dentro de un docuemnto en especifico',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onPressed2() async {
    // Obtiene todos los docuemtos de una coleccion en especifico sin conocer los docuemntos

    fs.collection("users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        // print('Clave: ${result.id} -> ${result.data()}');
        result.data().forEach((key, value) {
          print('$key: $value');
        });
        print('----------------------------------');
      });
    });

    // Obtiene todos los campos de un docuemnto en especifico dentro de una coleccion en especifico
    var userCollectionSpecicly =
        await fs.collection('users').doc('Grgpk37OCLLSotER0e07').get();
    print('Usuario especifico => ${userCollectionSpecicly.data()}');
    print('----------------------------------');
  }

  void _onPressed3() {
    // Obtiene todos los campos de un docuemtnos dentro de una subcoleccion dentro de un docuemnto en especifico
    fs
        .collection('negocios')
        .doc('alquimista')
        .collection('comidas')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print('Clave => ${result.id}');
        result.data().forEach((key, value) {
          print('$key => $value');
        });
        print('----------------------------------');
      });
    });
  }
}
