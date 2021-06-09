import 'package:flutter/material.dart';

class CrudFireStore extends StatelessWidget {
  const CrudFireStore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD en FireStore'),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/create');
            },
            child: Text('Create'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/read');
            },
            child: Text('Read'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/update');
            },
            child: Text('Update'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/delete');
            },
            child: Text('Delete'),
          ),
        ]),
      ),
    );
  }
}
