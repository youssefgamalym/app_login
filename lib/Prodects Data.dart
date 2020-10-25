import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class prodectsData extends StatefulWidget {
  @override
  _prodectsDataState createState() => _prodectsDataState();
}

class _prodectsDataState extends State<prodectsData> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  String nameProjact;
  String projactPrice;
  // IconButton
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text(
              'Add projacts',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {
                  Navigator.pushNamed(context, 'chat');
                })
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                'Projact Name :',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (name) {
                    nameProjact = name;
                  },
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Projact Price :',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (price) {
                    projactPrice = price;
                  },
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
          RaisedButton(
              child: Text('Add projact'),
              onPressed: () {
                var productMap = {
                  'product_name': nameProjact,
                  'product_price': projactPrice
                };
                productsCollection
                    .add(productMap)
                    .then((value) => print(value.toString()))
                    .catchError((error) => print("Error: $error"));
              }),
          StreamBuilder(
              stream: productsCollection.snapshots(),
              builder: (context, snapShot) {
                return Expanded(
                  child: ListView(
                    children: snapShot.data.docs.map<Widget>((document) {
                      String name = document.data()['product_name'];
                      String price = document.data()['product_price'];
                      print("map: " + document.data().toString());
                      return ListTile(title: Text(name), subtitle: Text(price));
                    }).toList(),
                  ),
                );
              })
        ],
      ),
    );
  }
}

var newProjactNameList = [];
var newProjactPriceList = [];

addNewProjactName(nameProjact) {
  newProjactNameList.add(nameProjact);
}

addNewProjactPrice(projactPrice) {
  newProjactPriceList.add(projactPrice);
}
