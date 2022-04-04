

import 'package:flutter/material.dart';

class topCustomListTile extends StatelessWidget {
  // bool values = true;

  int index;

  String imageurl;

  String title;

  String subtitle;

  topCustomListTile(
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
                                    Icons.more_vert,
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
