import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget mySizebox() {
    return SizedBox(
      width: 3.0,
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signIn(),
          ),
          mySizebox(),
          Expanded(
            child: signUp(),
          ),
        ],
      ),
    );
  }

  Widget signUp() {
    return RaisedButton(color: Colors.blue[200],
      child: Text('Sign Up'),
      onPressed: () {},
    );
  }

  Widget signIn() {
    return RaisedButton(color: Colors.blue[800],
      child: Text('sign In',style: TextStyle(color: Colors.white),),
      onPressed: () {},
    );
  }

  Widget emailTextFormfield() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: 250.0,
        child: TextFormField(
          decoration: InputDecoration(
              labelText: 'Email :', helperText: 'your@email.com'),
        ),
      ),
    );
  }

  Widget passwordTextFromfield() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Password :', helperText: 'More 6 Charactor'),
      ),
    );
  }

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
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      child: Text(
        'tong News',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue[800],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 80.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showlogo(),
            showName(),
            emailTextFormfield(),
            passwordTextFromfield(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
