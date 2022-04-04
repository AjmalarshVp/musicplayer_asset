import 'package:flutter/material.dart';
import 'package:music_player/screens/bottomnanigation.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    toHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 24, 3, 18),
                Color.fromARGB(255, 2, 34, 34)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: ClipRRect(
              //borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                
                'assets/_splash.png', fit: BoxFit.fill,
                //color: Colors.transparent,
                 height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> toHomeScreen() async {
    await Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
                    
              //return MusicList(imageurl: 'assets/images/mj.jpg', header: 'Beat it', subhead: 'Michel jackson', icon1: IconButton(icon: Icon(Icons.play_arrow),onPressed: (){},), icon2: IconButton(onPressed: (){}, icon: Icon(Icons.skip_next)));
              //return NowPlaying(); 
              return MyStatefulWidget();
            },
          ),
        );
      },
    );
  }
}
