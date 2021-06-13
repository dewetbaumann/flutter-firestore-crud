import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final fs = FirebaseFirestore.instance;

class CreateFirestore extends StatelessWidget {
  const CreateFirestore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create data to FireStore'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        child: TextButton(
          onPressed: () {
            //En vez de pasarle los datos en crudos tmb podriamos pasarle un MAP
            fs.collection('users').add({
              'nombre': 'john',
              'apellido': 'Travolta',
              'dni': 9156458,
            });

            // Si queremos saber cual es el ID con el cual fue agregado en nuevo
            // usuario ya que firestore lo crea de forma automatica, solamente
            // debemos agregar el metodo de abajo al finalizar el metodo .add()
            // .then((value) {
            //   print(value.id);
            // });
          },
          child: Text(
            'Añadir datos a la coleccion users',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
