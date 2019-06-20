import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  Widget nameText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Display Name ;',
          labelStyle: TextStyle(
            color: Colors.blue[600],
          ),
          hintText: 'Your first Name',
          icon: Icon(
            Icons.face,
            color: Colors.blue[600],
            size: 40.0,
          ),
        ),
      ),
    );
  }

  Widget userText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'emailtext',
          labelStyle: TextStyle(color: Colors.green[800]),
          hintText: 'yougmail.com',
          icon: Icon(
            Icons.email,
            color: Colors.green[800],
            size: 40.0,
          ),
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'password :',
            labelStyle: TextStyle(color: Colors.red[600]),
            hintText: 'More 6 Charactor',
            icon: Icon(
              Icons.lock,
              color: Colors.red[600],
              size: 40.0,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[uploadButton()],
        backgroundColor: Colors.red[600],
        title: Text('Register'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            nameText(),
            userText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
