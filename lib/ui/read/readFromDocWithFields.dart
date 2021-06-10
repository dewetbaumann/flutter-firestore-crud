import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final fs = FirebaseFirestore.instance;

class ReadFromDocWithFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leer datos'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        child: StreamBuilder<QuerySnapshot>(
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
      ),
    );
  }
}
