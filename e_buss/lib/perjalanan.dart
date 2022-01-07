import 'package:flutter/material.dart';

class perjalanan extends StatefulWidget {
  

  @override
  _perjalananState createState() => _perjalananState();
}

class _perjalananState extends State<perjalanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perjalanan saya"),
        leading: IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: Icon(Icons.list),
          iconSize: 35,
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        elevation: 5,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 460),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        
      ),

    );
  }
}
