import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showlogo() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: 150.0,
        height: 150.0,
        child: Image.asset(
          'images/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget showName() {
    return Text(
      'tong News',
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.blue[800],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showlogo(),
            showName(),
          ],
        ),
      ),
    );
  }
}
