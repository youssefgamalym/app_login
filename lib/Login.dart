import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Sign in ',
          style: TextStyle(
              fontSize: 25,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black26,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Email Address :',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      child: TextField(
                        onChanged: (value1) {
                          email = value1;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      width: 200),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Password :',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      child: TextField(
                        onChanged: (value2) {
                          password = value2;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      width: 200),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Forget Password ?',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 15,
                      decorationStyle: TextDecorationStyle.solid),
                ),
              ),
              RaisedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: Colors.indigo,
                  onPressed: () async {
                    try {
                      final User = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (User != null) {
                        Navigator.pushNamed(context, 'prodectsdata');
                        _controller.clear();
                      }
                    } catch (e) {
                      print(e);
                    }
                  })
            ],
          ),
        ],
      ),
    );
  }
}
