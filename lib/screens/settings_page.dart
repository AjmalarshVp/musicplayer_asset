import 'package:flutter/material.dart';


class settings extends StatelessWidget {
  const settings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),centerTitle: true,backgroundColor: Color.fromARGB(255, 4, 34, 31),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9,
                ],
                colors: [
                  Color.fromARGB(255, 5, 54, 50),
                  Color.fromARGB(255, 2, 30, 34),
                  Color.fromARGB(255, 2, 87, 87),
                  Color.fromARGB(255, 5, 77, 69),
                ],
              )
            ),
        child: Padding(
          padding: const EdgeInsets.all(35),
           child:   ClipRRect(
           borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(20)),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9,
                ],
                colors: [
                  Color.fromARGB(255, 145, 177, 174),
                  Color.fromARGB(255, 3, 37, 43),
                  Color.fromARGB(255, 11, 49, 49),
                  Color.fromARGB(255, 5, 77, 69),
                ],
              )
    
                ),
            

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton.icon(onPressed: (){
                        
                      }, icon:Icon(Icons.person_outlined,size: 30,color: Colors.white,) , label: Text('About me',style: TextStyle(fontSize: 19,color: Colors.white),)),
                      SizedBox(height: 20,),
                      TextButton.icon(onPressed: (){}, icon:Icon(Icons.notifications_outlined,size: 30,color: Colors.white,) , label: Text('Notification',style: TextStyle(fontSize: 19,color: Colors.white),)),
                                    SizedBox(height: 20,),
                      TextButton.icon(onPressed: (){}, icon:Icon(Icons.share,size: 30,color: Colors.white,) , label: Text('Share',style: TextStyle(fontSize: 19,color: Colors.white),)),
                      SizedBox(height: 20,),
                      TextButton.icon(onPressed: (){}, icon:Icon(Icons.report_problem,size: 30,color: Colors.white,) , label: Text('License',style: TextStyle(fontSize: 19,color: Colors.white),)),
                      SizedBox(height: 20,),
                      TextButton.icon(onPressed: (){}, icon:Icon(Icons.security,size: 30,color: Colors.white,) , label: Text('PrivacyPolicy',style: TextStyle(fontSize: 19,color: Colors.white),))
                    ],
                  ),
                ),
                
                
                ),
              
            ],
          ),
        ),
        ),
      ),
    );
  }
}