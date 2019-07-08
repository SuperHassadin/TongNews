import 'package:flutter/material.dart';
import 'package:tong_news/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'news_list.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {

  // Explicit
  FirebaseAuth  firebaseAuth = FirebaseAuth.instance;


  // Method


  @override
  void initState(){
    super.initState();
    loadCurrentUser();
  }

  Future loadCurrentUser() async {


    await firebaseAuth.currentUser().then((objValue){
      if (objValue != null) {
        print('logined');
        moveToNewlist(context);


      }

    });
    

  }

  void moveToNewlist(BuildContext context){


    var newsListRoute = MaterialPageRoute(builder: (BuildContext context) => NewLists());
    Navigator.of(context).pushAndRemoveUntil(newsListRoute, (Route<dynamic> route) => false);

  }


  Widget mySizebox() {
    return SizedBox(
      width: 3.0,
    );
  }

  Widget showButton(BuildContext context) {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signIn(),
          ),
          mySizebox(),
          Expanded(
            child: signUp(context),
          ),
        ],
      ),
    );
  }

  Widget signUp(BuildContext context) {
    return RaisedButton(
      color: Colors.blue[200],
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click SignUp');

        // Create Route
        var registerRoute = MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);

      },
    );
  }

  Widget signIn() {
    return RaisedButton(
      color: Colors.blue[800],
      child: Text(
        'sign In',
        style: TextStyle(color: Colors.white),
      ),
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
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blue[700]],
            radius: 2.0, center: Alignment(0, 0)
          ),
        ),
        padding: EdgeInsets.only(top: 80.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showlogo(),
            showName(),
            emailTextFormfield(),
            passwordTextFromfield(),
            showButton(context),
          ],
        ),
      ),
    );
  }
}
