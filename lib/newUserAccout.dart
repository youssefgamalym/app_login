import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class newUserAccout extends StatefulWidget {
  @override
  _newUserAccoutState createState() => _newUserAccoutState();
}

class _newUserAccoutState extends State<newUserAccout> {
  String C_email, username;
  String C_password;
  TextEditingController _controller = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        centerTitle: true,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 30),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'User Name :',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (name) {
                        username = name;
                      },
                      decoration: InputDecoration(
                        hintText: " User Name",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Email Address :',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (valueCE) {
                        C_email = valueCE;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "  Enter Email Addresse",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Password :',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (valueCP) {
                        C_password = valueCP;
                      },
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: " Enter Password ",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Repeat Password :',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: " Enter Password again",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Phone Number:',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 180,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: " Enter Phone Number",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, right: 50, left: 50),
          child: Container(
            width: 250,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "webViewGoogle");
                    },
                    child: Image(
                      image: AssetImage('Images/google.png'),
                      width: 50,
                      height: 50,
                    )),
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "webViewFacebook");
                    },
                    child: Image(
                      image: AssetImage('Images/facebook.png'),
                      width: 50,
                      height: 50,
                    )),
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "webViewTwitter");
                    },
                    child: Image(
                      image: AssetImage('Images/twitter.png'),
                      width: 50,
                      height: 50,
                    )),

                // Image.asset(
                //   'Images/twitter.png',
                //   width: 50,
                //   height: 50,
                // ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            RaisedButton(
                child: Text('Next'),
                onPressed: () async {
                  try {
                    final User = await _auth
                        .createUserWithEmailAndPassword(
                            email: C_email, password: C_password)
                        .then((nameuser) {
                      nameuser.user.updateProfile(displayName: username);
                    });
                    if (User != null) {
                      Navigator.pushNamed(context, 'prodectsdata');
                      _controller.clear();
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
          ],
        )
      ]),
    );
  }
}
