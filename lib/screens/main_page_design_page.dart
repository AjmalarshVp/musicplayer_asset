import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screens/custum/topcustomtile.dart';
import 'package:music_player/screens/custum/toplistcusum.dart';
import 'package:music_player/screens/listtile.dart';
import 'package:music_player/screens/musiclist.dart';

class design_main_paage extends StatefulWidget {
  const design_main_paage({ Key? key }) : super(key: key);

  @override
  State<design_main_paage> createState() => _design_main_paageState();
}

class _design_main_paageState extends State<design_main_paage> {
  
  final AssetsAudioPlayer audioPlayer=AssetsAudioPlayer();
  double screenheight =0;
  double screenwidth=0;
  final maincolor =Color(0xff181c27);
  final inactivecolor =Color(0xff31bac7);
  // List<Audio> audiolist =[
  //   Audio('assets/Aaya Ye Jhund Hai Jhund 128 Kbps.mp3',
  //   metas: Metas(
  //     title: 'ALL',
  //     artist: 'ajmal',
  //     image: MetasImage.asset('assets/91205795_2504272639901977_7469197545776520837_n.jpg'),
  //   )
  //   ),
  //    Audio('assets/Aaya Ye Jhund Hai Jhund 128 Kbps.mp3',
  //   metas: Metas(
  //     title: 'love1',
  //     artist: 'ajmal',
  //     image: MetasImage.asset('assets/91205795_2504272639901977_7469197545776520837_n.jpg'),
  //   )
  //   ),
  //    Audio('assets/Aaya Ye Jhund Hai Jhund 128 Kbps.mp3',
  //   metas: Metas(
  //     title: 'love2',
  //     artist: 'ajmal',
  //     image: MetasImage.asset('assets/91205795_2504272639901977_7469197545776520837_n.jpg'),
  //   )
  //   ),
  //    Audio('assets/Aaya Ye Jhund Hai Jhund 128 Kbps.mp3',
  //   metas: Metas(
  //     title: 'love3',
  //     artist: 'ajmal',
  //     image: MetasImage.asset('assets/91205795_2504272639901977_7469197545776520837_n.jpg'),
  //   )
  //   ),
  // ];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setupPlaylist();
  // }
  // void setupPlaylist()async{
  //   await audioPlayer.open(Playlist(audios: audiolist ),autoStart: false,loopMode: LoopMode.playlist);

  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   audioPlayer.dispose();

  // }

 
  @override
  Widget build(BuildContext context) {
    screenheight=MediaQuery.of(context).size.height;
    screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
    //  resizeToAvoidBottomInset:false,
      backgroundColor: Color.fromARGB(255, 2, 36, 41),
      appBar  :AppBar(
       backgroundColor: Color.fromARGB(255, 16, 37, 34),
        toolbarHeight: 90,
        title: Padding(
          padding: const EdgeInsets.only(right: 150),
          child: TextFormField(
            
            
            decoration: InputDecoration(filled: true,fillColor: Color.fromARGB(255, 2, 41, 43),hintText: 'Search',),
          ),
        ),
        // title: Container(
        //               height: 50,
        //               width: 90,
        //               decoration: BoxDecoration(
        //                   color: Colors.white12,
        //                   borderRadius: BorderRadius.circular(20),
        //                   boxShadow: const [
        //                     BoxShadow(
        //                       color: Colors.white10,
        //                       spreadRadius: 0,
        //                       blurRadius: 6,
        //                       offset: Offset(0, 3),
        //                     )
        //                   ]),
        //           child:  TextField(
        //                           decoration: InputDecoration(
        //           hintText: "Type your favourate ",
        //           border: OutlineInputBorder(
        //                     borderSide:  BorderSide(
        //                       color: Colors.teal,
        //                     ),
        //                   ),
        //                           )
        //                         ),
                    
        //           )
      ),
      body:
       Column(
         children: [
           Expanded(
             child: ListView.separated(scrollDirection: Axis.horizontal, itemBuilder:  (context, index) {
                return topCustomListTile(title:toplistaudio[index].metas.title.toString() , subtitle:toplistaudio[index].metas.artist.toString(), imageurl: toplistaudio[index].metas.image!.path, index: index,);
              }, separatorBuilder :(BuildContext context,index){
                print(audiolist);
                return SizedBox(
                  height: 5,
                );
              }, itemCount:audiolist.length),
           ),
            Expanded(
              flex: 3,
             child: ListView.separated( itemBuilder:  (context, index) {
                return CustomListTile(title:audiolist[index].metas.title.toString() , subtitle:audiolist[index].metas.artist.toString(), imageurl: audiolist[index].metas.image!.path, index: index,);
              }, separatorBuilder :(BuildContext context,index){
                print(audiolist);
                return SizedBox(
                  height: 5,
                );
              }, itemCount:audiolist.length),
                     ),
         ],
       ),
      
    );
  }
}