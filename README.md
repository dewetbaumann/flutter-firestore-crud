# Documentacion del CRUD

![](assets/banner.png)

## Descripcion

En este pequeño proyecto utilizamos la base de datos NoSQL Firestore para crear una apliacaion la cual nos permita ver de forma muy superficial peticiones de:

+ Lectura.
+ Escritura.
+ Actualizacion.
+ Eliminar.

En la continuidad del documento dejo de forma rapida un acceso al a las funciones de Firestore, para que se pueda ver de una forma mas simple y rapida sin descargar la app las funcionalidades implementadas.

---

## Lectura
+ Leer campos desde los documentos, conociendo la coleccion y los campos.
```dart
StreamBuilder<QuerySnapshot>(
    stream: fs.collection("tasks").snapshots(),
    builder:
        (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
    switch (snapshot.connectionState) {
        case ConnectionState.waiting:
        return new Text('Loading...');
        default:
        return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text('Title: ${document['title']}'),
                    Text('Description: ${document['description']}'),
                ],
                ),
            );
            }).toList(),
        );
    }
    },
),
```

+ Leer campos desde los documentos, sin conocer / conociendo los documentos.
```dart
Future<void> _onPressed2() async {
    fs.collection("users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        result.data().forEach((key, value) {
          print('$key: $value');
        });
      });
    });

    var userCollectionSpecicly =
        await fs.collection('users').doc('Grgpk37OCLLSotER0e07').get();
    print('Usuario especifico => ${userCollectionSpecicly.data()}');
  }
```

+ Leer todos los campos de un documento dentro de una subcoleccion dentro de un docuemnto en especifico.
```dart
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
```

---

## Escritura
+ En este ejemplo me gustaria aclara que en vez de pasarle los datos en crudos tmb podriamos pasarle un MAP, pero a fin de demostracion hice lo mas claro posible.

```dart
//Podriamos pasarle un MAP
fs.collection('users').add({
    'nombre': 'john',
    'apellido': 'Travolta',
    'dni': 9156458,
});

```
### Nota
Si queremos saber cual es el ID con el cual fue agregado en nuevo usuario ya que Firestore lo agreaga de forma automatica, solamente debemos agregar el metodo siguiente al finalizar el metodo `add():`

```dart
.then((value) {
print(value.id);
});
```
---

## Actualizacion
+ Actualizamos el nombre de un docuemntos y cuando termine mandamos a imprimir por consola actualizacion exitosa.

```dart
fs.collection('users').doc('Grgpk37OCLLSotER0e07').update(
    {'apellido': 'Parker', 'nombre': 'Peter'}).then((_) {
    print("Actualizacion exitosa!");
});
```

+ Añadir campo a un documento especifico.
```dart
fs
    .collection('users')
    .doc('Grgpk37OCLLSotER0e07')
    .update({'grupo': 'Los Vengadores'}).then((_) {
    print("Actualizacion exitosa!");
});
```
### Nota
Con el motodo set()con merge:true actualizará los campos en el documento o lo creará si no existe mientras update()actualizará los campos pero fallará si el documento no existe.

+ Añadir subcoleccion a un docuemento en especifico.

```dart
fs
    .collection('users')
    .doc('Grgpk37OCLLSotER0e07')
    .collection('poderes')
    .add({
    'poder 1': 'Tirar golpes',
    'poder 2': 'Trepar paredes',
    'poder 3': 'Saltar muy alto'
});
```
---
## Eliminar
+ Eliminar documentos.
```dart
fs
    .collection("collectionToDelete")
    .doc('KyMUxe4UuaesE7ec6MoE')
    .delete();
```
+ Eliminar campo de un documento.
```dart
fs
    .collection('collectionToDelete')
    .doc('document')
    .update({'fieldToDelete': FieldValue.delete()});
```

### Nota:
Es importante recordar que segun la [Docuementacion oficial](https://firebase.google.com/docs/firestore/manage-data/delete-data?hl=es-419#collections) de Firebase no es recomendado eliminar colecciones desde Android, por lo tanto no se incluyo en el ejemplo el mismo
