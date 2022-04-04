

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screens/favorite_custom.dart';
import 'package:music_player/screens/search.dart';

class favorite_list extends StatelessWidget {
  // bool values = true;

  int index;

  String imageurl;

  String title;

  String subtitle;

 favorite_list (
      {Key? key,
      required this.imageurl,
      required this.title,
      required this.subtitle,
      this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maincolor = Color.fromARGB(255, 29, 34, 49);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                
              },
              child: SizedBox(
                //width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.17,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    
                      color: maincolor, borderRadius: BorderRadius.circular(20),image: DecorationImage(image: AssetImage(imageurl),fit: BoxFit.cover,opacity: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child:
                                    
                                   Image.asset(
                                      imageurl,
                                      width: 35,
                                      height: 35,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 100,
                                        child: Text(
                                          title.toString(),
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white),
                                        )),
                                    Text(
                                      subtitle.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class favorite_listing extends StatefulWidget {
  const favorite_listing({ Key? key }) : super(key: key);

  @override
  State<favorite_listing> createState() => favorite_listingState();
}

class favorite_listingState extends State<favorite_listing> {
  
  final AssetsAudioPlayer audioPlayer=AssetsAudioPlayer();
  double screenheight =0;
  double screenwidth=0;
  final maincolor =Color(0xff181c27);
  final inactivecolor =Color(0xff31bac7);

 
  @override
  Widget build(BuildContext context) {
    screenheight=MediaQuery.of(context).size.height;
    screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
   
      backgroundColor: Color.fromARGB(255, 2, 36, 41),
      appBar  :AppBar(
       backgroundColor: Color.fromARGB(255, 16, 37, 34),
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(right: 150),
          child: IconButton(onPressed: (){
            showSearch(context: context, delegate: MysearchDelegate(),);

          }, icon:Icon(Icons.search_rounded)),
          // child: TextFormField(
            
          //   decoration: InputDecoration(filled: true,fillColor: Colors.grey,hintText: 'Search',),
          // ),
        ),
       
      ),
      body:
       Column(
         children: [
           
            Expanded(
              flex: 3,
             child: ListView.separated( itemBuilder:  (context, index) {
                return favorite_list(title:audiolist[index].metas.title.toString() , subtitle:audiolist[index].metas.artist.toString(), imageurl: audiolist[index].metas.image!.path, index: index,);
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

