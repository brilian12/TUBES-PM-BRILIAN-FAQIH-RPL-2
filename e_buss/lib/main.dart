import 'package:e_buss/beranda.dart';
import 'package:e_buss/hal_utama.dart';
import 'package:e_buss/login.dart';
import 'package:e_buss/pendaftaran1.dart';
import 'package:e_buss/pendaftaran2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: login(),
      initialRoute: '/',
      routes: { 
        '/utama': (context) => hal_utama(),
        '/pendaftaran1': (context) => pendaftaran1(),
        '/login': (context) => login(),
      }
    );
  }
}


