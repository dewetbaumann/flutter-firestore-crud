import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final fs = FirebaseFirestore.instance;

class ReadFirestore extends StatefulWidget {
  @override
  _ReadFirestoreState createState() => _ReadFirestoreState();
}

class _ReadFirestoreState extends State<ReadFirestore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read data from FireStore'),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: fs.collection("tasks").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    return new ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return new Column(
                          children: [
                            Text('Title: ${document['title']}'),
                            Text('Description: ${document['description']}'),
                          ],
                        );
                      }).toList(),
                    );
                }
              },
            )),
      ),
    );
  }
}
