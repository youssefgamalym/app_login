import 'package:app_login/Home.dart';
import 'package:app_login/mapfile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'chat.dart';
import 'Login.dart';
import 'Prodects Data.dart';
import 'WebViewScreenFacebook.dart';
import 'WebViewScreenGoogle.dart';
import 'WebViewScreenTwitter.dart';
import 'newUserAccout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: home(),
      routes: {
        'login': ((context) => Login()),
        'newUser': ((context) => newUserAccout()),
        'webViewFacebook': ((context) => WebViewScreenFacebook()),
        'webViewTwitter': ((context) => WebViewScreenTwitter()),
        'webViewGoogle': ((context) => WebViewScreenGoogle()),
        'prodectsdata': ((context) => prodectsData()),
        'chat': ((context) => ChatScreen()),
        'map': ((context) => MyGoogleMap())
      },
    );
  }
}
