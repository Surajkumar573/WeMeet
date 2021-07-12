import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/splashscreen.dart';
import 'package:flutter_application_1/styles.dart';
import 'package:introduction_screen/introduction_screen.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({ Key? key }) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    
    return IntroductionScreen(
      globalBackgroundColor: Colors.orange[50],
      
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Welcome to WeMeet, the best Video Conferencing App",
          image: Center(
            child: Image.asset('images/welcome.jpg', height: 200, ),),
          decoration: PageDecoration(
            
             bodyTextStyle: TextStyle(
               fontStyle: FontStyle.italic,
               fontSize: 23,
               color: Colors.red,
               fontWeight: FontWeight.w500,
            ),
            titleTextStyle: myStyle(45, Colors.indigo)
          )
        ),
        
           PageViewModel(
          title: "Join or Create meetings",
          body: "Simple and Easy interface for user's better experience",
          
          image: Center(
            child: Image.asset('images/meeting.png', height: 250,),),
            
          decoration: PageDecoration(
          
            bodyTextStyle: TextStyle(
               fontStyle: FontStyle.italic,
               fontSize: 23,
               color: Colors.red,
               fontWeight: FontWeight.w500,
            ),
            titleTextStyle: myStyle(35, Colors.indigo)
            
          )
          
        ),
           PageViewModel(
          title: "Security",
          body: "Your security is very important for us",
          image: Center(
            child: Image.asset('images/Security.png', height: 250),),
          decoration: PageDecoration(
            
             bodyTextStyle: TextStyle(
               fontStyle: FontStyle.italic,
               fontSize: 25,
               color: Colors.red,
               fontWeight: FontWeight.w500,
            ),
            titleTextStyle: myStyle(40, Colors.indigo)
          )
        )
      ],
      
      onDone: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
      },
      
      next: const Icon(Icons.arrow_forward_ios),
      done: Text("Done", style: myStyle(20,Colors.black),),
      
    );
  }
}