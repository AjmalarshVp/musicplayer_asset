// ignore_for_file: sized_box_for_whitespace

import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:music_player/screens/musiclist.dart';

//late AssetsAudioPlayer _assetsAudioPlayer;

class inner_player extends StatefulWidget {
  int index;
  bool playing = false;

  String imageurl;

  String title;

  String subtitle;
  inner_player(
      {Key? key,
      required this.imageurl,
      required this.subtitle,
      required this.title,
      required this.index})
      : super(key: key);

  @override
  State<inner_player> createState() => _inner_playerState();
}


double slidervalue = 0;
double? height;
double? width;

class _inner_playerState extends State<inner_player> {
  late AssetsAudioPlayer audioPlayer;
  double? height;
double? width;
  var assetsAudioPlayer = AssetsAudioPlayer();
  final List<StreamSubscription> subscription = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    subscription.add(assetsAudioPlayer.playlistAudioFinished.listen((data) {
      //print('playlistAudioFinished :$data');
    }));
    subscription.add(assetsAudioPlayer.audioSessionId.listen((sessionId) {
      //print('audioSessionId : $sessionId');
    }));
    openPlayer();
  }

  void openPlayer() async {
    await assetsAudioPlayer.open(
      Playlist(audios: audiolist, startIndex: widget.index),
      showNotification: true,
      autoStart: true,
      //loopMode: LoopMode.playlist,
      playInBackground: PlayInBackground.enabled,
    );
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  bool isplaying = false;
  IconData playbtn = Icons.pause_circle_outline_rounded;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        backgroundColor: const Color.fromARGB(255, 24, 3, 18),
        centerTitle: true,
        title: const Text(
          'Now Playing',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://cdn.wallpapersafari.com/39/14/KAT3RG.jpg'))
          
          
          // gradient: LinearGradient(colors: [
          //   Color.fromARGB(255, 24, 3, 18),
          //   Color.fromRGBO(21, 154, 211, 1)
          // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            StreamBuilder<Playing?>(
              stream: assetsAudioPlayer.current,
              builder: (context, playing) {
                if (playing.data != null) {
                  final myaudio =
                      find(audiolist, playing.data!.audio.assetAudioPath);
                      print("......................$audiolist");
                  return Column(
                    children: [
                      
                      Column(
                        children: [
                           SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            "${myaudio.metas.title}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            "${myaudio.metas.artist}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.00,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 42, left: 43, right: 42, bottom: 20),
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.35,
                              width: MediaQuery.of(context).size.width*0.80,
                              decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(190),
                                gradient: const LinearGradient(
                                  colors: [Color(0xff177281), Color(0xff31bac7)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Color(0xff31bac7),
                                    offset: Offset(8, 6),
                                    blurRadius: 20,
                                  ),
                                  const BoxShadow(
                                    color: Color(0xff31bac),
                                    offset: Offset(-8, -6),
                                    blurRadius: 12,
                                  ),
                                ]
                                 
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(10))),
                              ),
                              child: myaudio.metas.image?.path == null
                                  ? const SizedBox()
                                  : myaudio.metas.image?.type == ImageType.network
                                      ? Image.network(
                                          myaudio.metas.image!.path,
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.contain,
                                        )
                                      : CircleAvatar(
                                        backgroundImage:ExactAssetImage(myaudio.metas.image!.path,), 
                                        // child: ,
                              //           child: Image.asset(
                                          
                              //               myaudio.metas.image!.path,
                              // //               height: MediaQuery.of(context).size.height*0.35,
                              // // width: MediaQuery.of(context).size.width*0.80,
                              //              fit: BoxFit.fill,
                              //             ),
                                          
                                      ),
                            ),
                          ),
                        ],
                      ),
                     
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                          ),
                          
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0),
                              child: seekBarWidget(context)),
                               SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),

                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.playlist_add,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ),
                                IconButton(
                                  onPressed: () {
                                    assetsAudioPlayer.previous();
                                    setState(() {
                                      playbtn = Icons.pause_circle_sharp;
                                      isplaying = false;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.skip_previous,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (isplaying != true) {
                                      setState(() {
                                        playbtn =
                                            Icons.play_circle_filled_sharp;
                                        isplaying = true;
                                        assetsAudioPlayer.playOrPause();
                                      });
                                    } else {
                                      setState(() {
                                        playbtn = Icons.pause_circle_sharp;
                                        isplaying = false;
                                        assetsAudioPlayer.playOrPause();
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    playbtn,
                                    size: 70,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.19,
                                ),
                                IconButton(
                                  onPressed: () {
                                    assetsAudioPlayer.next();
                                    setState(() {
                                      playbtn = Icons.pause_circle_sharp;
                                      isplaying = false;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.skip_next,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       top: 00.0, left: 50.0, right: 50.0),
                          //   child: Container(
                          //     height: myHeight * 0.02,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10),
                          //         color: const Color.fromARGB(255, 58, 61, 59)),
                          //     child: Row(
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                                  
                          //         // IconButton(
                          //         //   onPressed: () {},
                          //         //   icon: Image.asset(
                          //         //     'assets/images/love.png',
                          //         //     color: Colors.red,
                          //         //     height: 25,
                          //         //   ),
                          //         // ),
                                
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  );
                }
                return const SizedBox();
              }, 
            ),
          ],
        ),
      ),
    );
  }

  Widget seekBarWidget(BuildContext ctx) {
    return assetsAudioPlayer.builderRealtimePlayingInfos(builder: (ctx, infos) {
      Duration currentPosition = infos.currentPosition;
      Duration total = infos.duration;
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: ProgressBar(
          progress: currentPosition,
          total: total,
          onSeek: (to) {
            assetsAudioPlayer.seek(to);
          },
          baseBarColor: Color.fromARGB(255, 190, 190, 190),
          progressBarColor: Color.fromARGB(234, 209, 120, 184),
          bufferedBarColor: Colors.green,
          thumbColor: Color.fromARGB(255, 214, 12, 157),
        ),
      );
    });
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  

