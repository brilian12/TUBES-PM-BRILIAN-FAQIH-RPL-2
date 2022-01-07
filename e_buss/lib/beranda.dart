import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'login.dart';

class Beranda extends StatefulWidget {
  
  static const routeName = '/utama';


  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {

  Dio dio=new Dio();

  TextEditingController _asal = TextEditingController();
  TextEditingController _tujuan = TextEditingController();
  

  

Future<void> datap()async{
var data;
 Response response;
    response = await dio.post("http://192.168.157.157/bus/login.php");
  data:FormData.fromMap(
        {
          "idp": "${(response.data['info']['nim'])}",
        }
    );
}



  
Future<void> pesan() async{
  print("OK ${_asal.text}");

 Response response;
    response = await dio.post("http://10.0.114.189/bus/pesan.php", data:FormData.fromMap(
        {
          "asal": "${_asal.text}",
          "tujuan": "${_tujuan.text}",
        }
    ));
    print(response.data);
 if(response.data['status']==1){
 print("pesan berhasil");
 print(response.data['data.0']);
 Navigator.pushNamed(context, '/utama');
 setState(() {
  //datap();
 _asal.text="";
 _tujuan.text="";
 
 });
 }
 else if (response.data['status']==0){
print("pesan gagal");
Navigator.pushNamed(context, '/utama');
 }
}




  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: Container(
 child: Column(
 children: <Widget>[
 Stack(
 children: <Widget>[backgroundHeader()],
 ),
 Text("hai brilian"),
 text(),
  SizedBox(
   width: 300,
 child: Column(
 mainAxisAlignment: MainAxisAlignment.center,
 crossAxisAlignment: CrossAxisAlignment.center,
 
        children: [
          
          
          TextFormField(
            controller: _asal,
            decoration: const InputDecoration(  
              icon: const Icon(Icons.airport_shuttle),  
              hintText: 'Masukan tempat pemberangkatan',  
              labelText: 'Pemberangkatan',  
            ),  
          ),  
        TextField(
            controller: _tujuan,  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.airport_shuttle),  
              hintText: 'Masukan tempat tujuan',  
              labelText: 'Tujuan',
               
            ), 
          ),
          SizedBox(width: 20,),
          Text("",style: TextStyle(height: 2)),  
          ElevatedButton(onPressed: ()=> {
            pesan() 
          }, 
          child: Text("Pesan",style: TextStyle(fontSize: 17)),
          )] 
      ),
 ),
 ],
 ),
 ),
 );
 }

  Widget backgroundHeader() {
    return Container(
   height: 300,
   width: double.infinity,
   decoration: BoxDecoration(
   image: DecorationImage(
  image: AssetImage("images/travel.jpg")
  ),
   ),
    );
  
}
}

Widget text(){
  return Center(
 child: Row(
 mainAxisAlignment: MainAxisAlignment.center,
 crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Container(
      height: 70,
      width: 115.0,
      color: Colors.lightBlue,
      child: Column(
      children: <Widget>[
      IconButton(onPressed: (){}, color: Colors.white,icon: Icon(Icons.article),iconSize: 30,),
      Text("Tickets"),
      ]
      ),
      ),
    
    Container(
      height: 70,
      width: 115.0,
      color: Colors.lightBlue,
      child: Column(
      children: <Widget>[
      IconButton(onPressed: (){}, color: Colors.white,icon: Icon(Icons.airport_shuttle),iconSize: 30,),
      Text("Bus"),
      ]
      ),
      ),
    
    Container(
      height: 70,
      width: 115.0,
      color: Colors.lightBlue,
      child: Column(
      children: <Widget>[
      IconButton(onPressed: (){}, color: Colors.white,icon: Icon(Icons.person_pin_circle),iconSize: 30,),
      Text("Operator"),
      ]
      ),
      ),
    
    
      
    
      ],
    ),
  );

  
  


}


