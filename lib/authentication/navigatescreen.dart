import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/loginscreen.dart';
import 'package:flutter_application_1/authentication/registerscreen.dart';
import 'package:flutter_application_1/styles.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:avatar_glow/avatar_glow.dart';
class NavigateScreen extends StatefulWidget {
  const NavigateScreen({ Key? key }) : super(key: key);

  @override
  _NavigateScreenState createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
            body: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height /2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:GradientColors.darkPink)
                  ),
              
                  child: AvatarGlow(
                    endRadius:120,
                     glowColor: Colors.lightBlue,
                     duration: Duration(milliseconds: 2000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: Duration(milliseconds: 50),
                    child: Material(
                    elevation: 18,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 65,
                      
                        backgroundImage: AssetImage('images/applogo.png'),              
                    ),
                    ),
                  ),
                  
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height /1.7,
                      margin: EdgeInsets.only(left:30,right:30,),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ],
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 26),
                          
                        child: Center(
            child: Image.asset('images/online.jpg', height: 150, ),
            ),
                        ),   
      //navigate to LoginScreen                                         
                          InkWell(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())),
                            child: Container(
                              width: MediaQuery.of(context).size.width /2,
                              height:  60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: GradientColors.beautifulGreen,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(
                        color: Colors.black, blurRadius: 4, offset: Offset(0, 2))
                  ]
                              ),
                             child: Center(
                               child: Text(
                                 "SIGN IN",
                                 style: myStyle(30, Colors.white),) ,),
                            ),
                          ),
                          SizedBox(
                            height:35,),
//navigate to RegisterScreen
                           InkWell(
                             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen())),
                             child: Container(
                              width: MediaQuery.of(context).size.width /2,
                              height:  60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: GradientColors.pink,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(
                        color: Colors.black, blurRadius: 4, offset: Offset(0, 2))
                  ]
                              ),
                             child: Center(
                               child: Text(
                                 "SIGN UP",
                                 style: myStyle(30, Colors.white),) ,),
                          ),
                           ),
                        ],
                        ),
                      )
                  
                )
              ],
            ),      
    );
  }
}
