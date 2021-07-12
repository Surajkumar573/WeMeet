import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/navigatescreen.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import '../styles.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
          ()=>Navigator.pushReplacement(context,
          MaterialPageRoute(builder:(context) =>NavigateScreen())
         )
         );
         
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                          radius:113,
                           backgroundColor: Colors.teal[600],
                        child: CircleAvatar(
                        radius: 110,
                       
                         backgroundImage: AssetImage('images/splash.jpg')
                         ),
                          ),
                          SizedBox(height:30,),
                          Container(
                  
                            child: Center(
                              child: Text('Good to see you here!!', style: myStyle(26, Colors.teal),),
                            ),
                          ),
                          SizedBox(height:28,),
                          Container(
                            margin: EdgeInsets.only(top: 10),                   
                            width: MediaQuery.of(context).size.width /1.2,
                            child: Center(
                              child: Text('Created with ❤ ️by Suraj Kumar', style: myStyle(16, Colors.black),),
                            ),
                            ),                                 
                        ],
      ),
      decoration: BoxDecoration(
                    gradient: LinearGradient(colors:GradientColors.sunnyMorning),
                    
                  ),
      ),
    );         
    
  }
}
