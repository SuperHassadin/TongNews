import 'package:flutter/material.dart';

class NewLists extends StatefulWidget {
  @override
  _NewListsState createState() => _NewListsState();
}

class _NewListsState extends State<NewLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New List'),
      ),
      body: Text('body'),
    );
  }
}
