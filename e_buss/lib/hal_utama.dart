import 'package:e_buss/akun.dart';
import 'package:e_buss/perjalanan.dart';
import 'package:flutter/material.dart';
import 'package:e_buss/beranda.dart';



class hal_utama extends StatefulWidget {
  

  @override
  hal_utama_state createState() => hal_utama_state();
}

class hal_utama_state extends State<hal_utama> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    
      Beranda(),
      perjalanan(),
      akun()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Perjalanan saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Akun saya',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        
        
        onTap: _onItemTapped,
      ),
      );
  }
}
