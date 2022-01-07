import 'package:flutter/material.dart';

class akun extends StatefulWidget {
  

  @override
  _akunState createState() => _akunState();
}

class _akunState extends State<akun> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
    title: Text("Akun saya"),
    leading: IconButton(onPressed: (){}, color: Colors.white,icon: Icon(Icons.person),iconSize: 35,),
    backgroundColor: Colors.lightBlue,
    centerTitle: true,
    elevation: 5,
    ),
  body: ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
   ListTile(
                    title: Text("Tentang akun"),
                    trailing: Icon(Icons.arrow_right_sharp),
                    ),
                
    ListTile(
                    title: Text("Perjalanan saya"),
                    trailing: Icon(Icons.arrow_right_sharp),
                    ),
    
    ListTile(
                    title: Text("Bahasa"),
                    trailing: Icon(Icons.arrow_right_sharp),
                    ),
                

   ListTile(
                    title: Text("Tentang akun"),
                    trailing: Icon(Icons.arrow_right_sharp),
                    ),
                

    
                 
              
          
  ],
)
    );
  }
}