import 'package:flutter/material.dart';
import 'package:music_player/screens/inner_playing_page.dart';

class play_Listcustum extends StatelessWidget {
  final dynamic imageurl;
  final String playlist_Name;
  Icon icon;
   var align;

  play_Listcustum(
      {Key? key,
      this.align,
      required this.imageurl,
      required this.playlist_Name,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maincolor = Color(0xff181c27);
   
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(0.80),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage(imageurl), fit: BoxFit.fitWidth)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      
                      playlist_Name,
                      textAlign: align,
                      style:  TextStyle( fontSize: 22, color: Colors.white,),
                    ),
                    IconButton(onPressed: () {
                      
                    }, icon: icon)
                  ],
                ),
              ),
              // child: Image.asset('assets/91205795_2504272639901977_7469197545776520837_n.jpg',fit: BoxFit.fill,),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

class play_List extends StatelessWidget {
  const play_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon icondel = Icon(
      Icons.delete,
      color: Colors.white,
      size: 28,
    );
    Icon iconadd = Icon(
      Icons.add,
      color: Colors.white,
      size: 28,
    );
    final maincolor = const Color(0xff181c27);
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 2, 36, 41),
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 2, 36, 41),
      ),
      body: Container(
        //height: double.infinity,
        // width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage('https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'), fit: BoxFit.fitWidth)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      
                      'Create Playlist',
                     // textAlign: align,
                      style:  TextStyle( fontSize: 22, color: Colors.white,),
                    ),
                    IconButton(onPressed: () {
                     showModalBottomSheet(context: context,isScrollControlled: true ,builder:(context) =>SingleChildScrollView(
                       child: Container(
                         color: Colors.black,
                         padding: EdgeInsets.only(
                           bottom:MediaQuery.of(context).viewInsets.bottom 
                           
                         ),
                         child: bottomsheet_playlist(),
                       ),
                     ) );
                      
                    }, icon: Icon(Icons.add,color: Colors.white,))
                  ],
                ),
              ),
              // child: Image.asset('assets/91205795_2504272639901977_7469197545776520837_n.jpg',fit: BoxFit.fill,),
            ),
            SizedBox(height: 20,),
                
                play_Listcustum(
                  imageurl:
                      'https://api.time.com/wp-content/uploads/2019/09/karaoke-mic.jpg',
                  playlist_Name: 'Pop',
                  icon: icondel,
                ),
                play_Listcustum(
                  imageurl:
                      'https://images.unsplash.com/photo-1498038432885-c6f3f1b912ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cm9jayUyMG11c2ljfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                  playlist_Name: 'Rock',
                  icon: icondel,
                ),
                play_Listcustum(
                  imageurl:
                      'https://image.shutterstock.com/image-illustration/3d-illustration-musical-notes-signs-260nw-761313844.jpg',
                  playlist_Name: 'Melody',
                  icon: icondel,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class bottomsheet_playlist extends StatelessWidget {
  const bottomsheet_playlist({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(40) ,
          topRight:Radius.circular(40 ),
        )
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Create Playlist',textAlign: TextAlign.center,),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
          onChanged: (newtext){},
          ),
         TextButton(onPressed: () {
           Navigator.pop(context);
         }, child: Text('Done '))
        ],
      ) ,
    
    );
  }
}

