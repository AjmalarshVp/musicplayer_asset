import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:music_player/screens/inner_playing_page.dart';
import 'package:music_player/screens/musiclist.dart';

class CustomListTile extends StatelessWidget {
  // bool values = true;

  int index;

  String imageurl;

  String title;

  String subtitle;

  CustomListTile(
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
      child: Column( 
        children: [
          FocusedMenuHolder(
          //  duration: Duration(milliseconds: 100),
            menuWidth: MediaQuery.of(context).size.width*0.7,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return inner_player(
                  imageurl: imageurl,
                  subtitle: subtitle,
                  title: title,
                  index: index,
                );
              }));
            },
            menuItems:<FocusedMenuItem> [
              FocusedMenuItem(title:Text('Favorate') , onPressed: (){},trailingIcon: Icon(Icons.heart_broken_outlined)),
              FocusedMenuItem(title:Text('Share') , onPressed: (){},trailingIcon: Icon(Icons.share)),
              FocusedMenuItem(title:Text('Delete',style: TextStyle(color: Colors.white),) , onPressed: (){},trailingIcon: Icon(Icons.delete,color: Colors.white,),backgroundColor: Colors.red),
            ],
            child: SizedBox(
            
              //width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.08,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  
                    color: maincolor, borderRadius: BorderRadius.circular(10),image: DecorationImage(image: AssetImage(imageurl),fit: BoxFit.cover,opacity: 0.3)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
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
                                child: CircleAvatar(
                                  backgroundImage:ExactAssetImage(imageurl),
                                  // child: Image.asset(
                                  //   imageurl,
                                  //   width: 35,
                                  //   height: 35,
                                  //   fit: BoxFit.fill,
                                  // ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 200,
                                      child: Text(
                                        
                                        title.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.teal),
                                      )),
                                  Text(
                                   
                                    subtitle.toString(),
                                    overflow:  TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                        
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
                          // Column(
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.all(8),
                          //       child: Icon(
                          //         Icons.more_vert,
                          //         color: Colors.grey[700],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
