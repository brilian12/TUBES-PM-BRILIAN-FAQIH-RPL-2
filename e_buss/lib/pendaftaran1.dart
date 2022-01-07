//import 'dart:html';



import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Mahasiswa{
 final String nama_depan;
 final String nama_belakang;
 final String username;
 final String password;
 Mahasiswa({required this.nama_depan, required this.nama_belakang, required this.username,required this.password});
}



class pendaftaran1 extends StatefulWidget{
  pendaftaran1_state createState() => pendaftaran1_state();
}

class pendaftaran1_state extends State {
  Dio dio=new Dio();

  TextEditingController _controllernadep = TextEditingController();
  TextEditingController _controllernabel = TextEditingController();
  TextEditingController _controllerus = TextEditingController();
  TextEditingController _controllerpw = TextEditingController();
  GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();

  Future<void> insertdata() async{
  print("OK ${_controllernadep.text}");

 Response response;
    response = await dio.post("http://10.0.114.189/bus/daftar.php", data:FormData.fromMap(
        {
          "nama_depan": "${_controllernadep.text}",
          "nama_belakang": "${_controllernabel.text}",
          "username": "${_controllerus.text}",
          "password": "${_controllerpw.text}",
        }
    ));
    print(response.data);
 if(response.data['status']==1){
 print("data disimpan");
 setState(() {
 _controllernadep.text="";
 _controllernabel.text="";
 _controllerus.text="";
 _controllerpw.text="";
 });
 }
}


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
            color: Colors.lightBlue
           ), 
          ),  
        ],
        
          ),
          SizedBox(height: 10),
         Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text("Register",textAlign: TextAlign.right,style: TextStyle(height: 3,fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blueAccent,)),
        TextFormField( 
            controller: _controllernadep, 
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Masukan Nama Depan',  
              labelText: 'Nama Depan',  
            ),  
          ),  
        TextFormField(  
            controller: _controllernabel,
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Masukan Nama Belakang',  
              labelText: 'Nama Belakang',  
            ),  
          ), 
          TextFormField(  
          controller: _controllerus,
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter your name',  
              labelText: 'Username',  
            ),  
          ),  
        TextField(  
            controller: _controllerpw,
            decoration: const InputDecoration(  
              icon: const Icon(Icons.lock),  
              hintText: 'Enter your password',  
              labelText: 'Password',
               
            ),  
            autofocus: false,
            obscureText: true,
          ),
          Text("",style: TextStyle(height: 2)),  
          ElevatedButton(onPressed: () => {
            insertdata(),
            Navigator.pushNamed(context, '/login')
          },
          child: Text("Daftar",style: TextStyle(fontSize: 18)),
          )
        ],
          ),
          Text("",style: TextStyle(height: 2)),  
        ],
          ),
        );
  }
}


