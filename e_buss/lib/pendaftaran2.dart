//import 'dart:html';



import 'package:flutter/material.dart';

class pendaftaran2 extends StatefulWidget{
  pendaftaran2_state createState() => pendaftaran2_state();
}

class pendaftaran2_state extends State {
  bool _register = true;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
          body:
          Column(  
        children: <Widget>[
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[ 
        Container(  
           height: 150,
           width: double.infinity,
           decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(1000),
            ),
           ), 
          ),  
        ],
        
          ),
          SizedBox(height: 10),
         Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
        children: <Widget>[
        Text("Register",textAlign: TextAlign.right,style: TextStyle(height: 3,fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blueAccent,)),
        TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter your name',  
              labelText: 'Username',  
            ),  
          ),  
        TextField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.lock),  
              hintText: 'Enter your password',  
              labelText: 'Password',
               
            ),  
            autofocus: false,
            obscureText: true,
          ),
          TextField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.lock),  
              hintText: 'Enter your password',  
              labelText: 'Verify Password',
               
            ),  
            autofocus: false,
            obscureText: true,
          ),
          Text("",style: TextStyle(height: 2)),  
          ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, '/login');
          }, 
          child: Text("Finish",style: TextStyle(fontSize: 18)),
          )
        ],
          ),
          Text("",style: TextStyle(height: 2)),
          Container(  
           height: 175,
           width: double.infinity,
           decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(1000),
            bottomRight: Radius.circular(50),
            ),
           ), 
          ),    
        ],
          ),
        );
  }
}

