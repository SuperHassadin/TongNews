import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // EXplicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Method
  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          register();
        }
      },
    );
  }

  Future register() async {
    print('name = $nameString, email = $emailString, pass = $passwordString');
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((objResponse) {
      print('Register Success');
      setupDisplayName();
    }).catchError((objResponse) {
      String error = objResponse.message;
      print('Error = $error');
      _showDialog(error);
    });
  }

  Future setupDisplayName() async {
    
        await firebaseAuth.currentUser().then((objValue) {
          UserUpdateInfo userUpdateInfo = UserUpdateInfo();
          userUpdateInfo.displayName = nameString;
          objValue.updateProfile(userUpdateInfo);

          

        });
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cannot Register'),
          content: Text('because : $message'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
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
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Display Name';
          }
        },
        onSaved: (String value) {
          nameString = value;
        },
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
        validator: (String value) {
          if (!((value.contains('@')) && (value.contains('.')))) {
            return 'Please Type Email Format';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
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
          ),
        ),
        validator: (String value) {
          if (value.length <= 5) {
            return 'More 6 Charactor';
          }
        },
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          uploadButton(),
        ],
        backgroundColor: Colors.red[600],
        title: Text('Register'),
      ),
      body: Form(
        key: formKey,
        child: Container(
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
      ),
    );
  }
}
