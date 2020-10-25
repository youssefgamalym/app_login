import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference chatCollection =
      FirebaseFirestore.instance.collection('chat');

  String Massage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: (Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    onChanged: (text) {
                      Massage = text;
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.deepOrange,
                    ),
                    onPressed: () {
                      var chatMap = {
                        'Massage': Massage,
                        'ussefName': _auth.currentUser.displayName
                      };
                      chatCollection
                          .add(chatMap)
                          .then((value) => print(value.toString()))
                          .catchError((error) => print("Error: $error"));
                    })
              ],
            ),
          ),
          StreamBuilder(
              stream: chatCollection.snapshots(),
              builder: (context, snapShot) {
                return Expanded(
                  child: ListView(
                    children: snapShot.data.docs.map<Widget>((document) {
                      String name = document.data()['ussefName'];
                      String massage = document.data()['Massage'];
                      print("map: " + document.data().toString());
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(width: 5)),
                          child: ListTile(
                              tileColor: Colors.blueAccent,
                              title: Text(
                                name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                massage,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                        ),
                      );
                    }).toList(),
                  ),
                );
              })
        ],
      )),
    );
  }
}
