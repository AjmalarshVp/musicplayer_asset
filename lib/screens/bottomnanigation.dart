import 'package:flutter/material.dart';
import 'package:music_player/screens/favourite.dart';
import 'package:music_player/screens/inner_playing_page.dart';
import 'package:music_player/screens/listtile.dart';
import 'package:music_player/screens/main_page_design_page.dart';
import 'package:music_player/screens/playlist.dart';
import 'package:music_player/screens/settings_page.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
 
  final maincolor =Color(0xff181c27);
  int _selectedIndex = 0;
  final pages =[design_main_paage(),favorite_listing(),play_List(),settings()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenheight=MediaQuery.of(context).size.height;
     double screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
     //appBar: AppBar(title: Text('ajmal'),backgroundColor: maincolor,),
      
      backgroundColor:Color.fromARGB(255, 2, 36, 41),
      body: 
       pages[_selectedIndex],
          bottomNavigationBar: ClipRRect(
           borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),

            child: BottomNavigationBar(
           backgroundColor: Color.fromARGB(255, 3, 17, 19),
        items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
           icon: Icon(Icons.home),
           label: 'Home',
           backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
           
           icon: Icon(Icons.library_music_rounded, ),
           label: 'Favorite',
           backgroundColor: Colors.green,
           
            ),
            BottomNavigationBarItem(
           icon: Icon(Icons.local_fire_department_rounded),
           label: 'library',
           backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
           icon: Icon(Icons.settings),
           label: 'Settings',
           backgroundColor: Colors.purple,
            ),
         
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        
        onTap: _onItemTapped ,
        type: BottomNavigationBarType.fixed,unselectedItemColor: Color.fromARGB(255, 13, 116, 93),
    iconSize: screenwidth*0.07,
      ),
          ),
      );
  }
}

