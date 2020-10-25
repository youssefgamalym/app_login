import 'package:flutter/cupertino.dart';

class listOfProjacts extends StatefulWidget {
  List<String> newProjactNameList = [""];
  List<String> newProjactPriceList = [""];
  listOfProjacts(this.newProjactNameList, this.newProjactPriceList);

  @override
  _listOfProjactsState createState() => _listOfProjactsState();
}

class _listOfProjactsState extends State<listOfProjacts> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}
