import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final fs = FirebaseFirestore.instance;

class UpdateFirestore extends StatelessWidget {
  const UpdateFirestore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update data from Firestore'),
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
                //Actualizamos el nombre de un docuemntos y cuando termine mandamos a imprimir por consola actualizacion exitosa
                fs.collection('users').doc('Grgpk37OCLLSotER0e07').update(
                    {'apellido': 'Parker', 'nombre': 'Peter'}).then((_) {
                  print("Actualizacion exitosa!");
                });
              },
              child: Text(
                'Actualizar campo de un documento especifico',
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              // Nota: con el motodo set()con merge:true actualizará los campos en el documento
              //o lo creará si no existe mientras update()actualizará los campos pero fallará
              //si el documento no existe
              onPressed: () {
                fs
                    .collection('users')
                    .doc('Grgpk37OCLLSotER0e07')
                    .update({'grupo': 'Los Vengadores'}).then((_) {
                  print("Actualizacion exitosa!");
                });
              },
              child: Text(
                'Añadir campo a un documento especifico',
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              onPressed: () {
                fs
                    .collection('users')
                    .doc('Grgpk37OCLLSotER0e07')
                    .collection('poderes')
                    .add({
                  'poder 1': 'Tirar golpes',
                  'poder 2': 'Trepar paredes',
                  'poder 3': 'Saltar muy alto'
                });
              },
              child: Text(
                'Añadir subcoleccion a un docuemento en especifico',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
