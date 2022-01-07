//import 'dart:html';


import 'package:dio/dio.dart';
import 'package:e_buss/beranda.dart';
import 'package:flutter/material.dart';

class ScreenArguments {
  final String id;
  

  ScreenArguments(this.id);
}

class login extends StatefulWidget{
  login_state createState() => login_state();
  static const routeName = '/extractArguments';
}

class login_state extends State {
  
Dio dio=new Dio();

  TextEditingController _us = TextEditingController();
  TextEditingController _pw = TextEditingController();

  
  
  Future<void> logins() async{
  print("OK ${_us.text}");

 Response response;
    response = await dio.post("http://10.0.114.189/bus/login.php", data:FormData.fromMap(
        {
          "username": "${_us.text}",
          "password": "${_pw.text}",
        }
    ));
    print(response.data);
 if(response.data['status']==1){
 //print(response.data['data']['id_penumpang']);
 var dat = response.data['data']['id_penumpang'];
 print(dat);
 print("login berhasil");
 Navigator.pushNamed(context, '/utama');
 Navigator.pushNamed(
                  context,
                  Beranda.routeName,
                  arguments: ScreenArguments(
                    "halooo:",
                    
                  ),
                );
 setState(() {
 _us.text="";
 _pw.text="";
 });
 }
 else if (response.data['status']==0){
print("login gagal");
Navigator.pushNamed(context, '/login');
 }
}


  
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold( 
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
            leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
  ), 
          ),
          body:
          Column(  
        children: <Widget>[
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,  
        children: <Widget>[ 
        Container(  
           height: 200,
           width: double.infinity,
           decoration: BoxDecoration(
            color: Colors.lightBlue,
           ), 
          ),  
        ],
        
          ),
          SizedBox(height: 10),
         Column(
            mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: <Widget>[
        Text("Login",textAlign: TextAlign.right,style: TextStyle(height: 3,fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blueAccent,)),
        TextFormField(
            controller: _us,
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter your name',  
              labelText: 'Username',  
            ),  
          ),  
        TextField(  
            controller: _pw,
            decoration: const InputDecoration(  
              icon: const Icon(Icons.lock),  
              hintText: 'Enter your password',  
              labelText: 'Password',
               
            ),  
            autofocus: false,
            obscureText: true,
          ),
          SizedBox(height: 20,),
          Center(child: Row(children: [
            Text("",style: TextStyle(height: 2)),  
          ElevatedButton(onPressed: () => {
            logins(),
          }, 
          child: Text("Login",style: TextStyle(fontSize: 17)),
          ),
          SizedBox(width: 20,),
          Text("",style: TextStyle(height: 2)),  
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/pendaftaran1');
          }, 
          child: Text("Daftar",style: TextStyle(fontSize: 17)),
          )
          ],))
          
        ],
          ),
          Text("",style: TextStyle(height: 2.8)), 
        ],
          ),
        );
  }
}


