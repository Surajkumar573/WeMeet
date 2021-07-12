import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/registerscreen.dart';
import 'package:flutter_application_1/authentication/resetscreen.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import '../styles.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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
                  child: Center(
                    
                    child: CircleAvatar(
                      radius: 65,
                      
                    backgroundImage: AssetImage('images/applogo.png')
                      
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height /1.7,
                      margin: EdgeInsets.only(left:30,right:30),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                          radius:35,
                           backgroundColor: Colors.red,
                        child: CircleAvatar(
                        radius: 33,
                        
                         backgroundImage: AssetImage('images/signin.jpg')
                         ),
                         
                          ),

                          //email address field
                          SizedBox(height:12,),
                          Container(
                            width: MediaQuery.of(context).size.width /1.7,
                            child:TextField(
                                style: myStyle(18,Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  prefixIcon: Icon(Icons.email),
                                  hintStyle: myStyle(20,Colors.grey,FontWeight.w700)
                                ),      
                          
                          ),
                          ),
                  
                         //password field
                          SizedBox(height:12),
                          Container(
                            
                            width: MediaQuery.of(context).size.width /1.7,
                            
                            child: TextField(
                              controller: passwordcontroller,
                                style: myStyle(18,Colors.black),
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: Icon(Icons.lock),
                                  hintStyle: myStyle(20,Colors.grey,FontWeight.w700)
                                ),      
                          
                          ),
                          ),

                          SizedBox(height: 5,),
                          InkWell(
                         child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       TextButton(
                        child: Text('Forgot Password?'),
                       onPressed: () => Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) => ResetScreen()),
                ),
              )
            ],
          ),
                          ),
                          //navigation to join meeting page
                          SizedBox(height:10,),
                          InkWell(
                            onTap: () {
                              try {
                                int count = 0;
                                FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
                                Navigator.popUntil(context, (route){
                                  return count++ ==2;
                                });
                              } catch (e) {
                                 print(e);
                                var snackbar = SnackBar(content: Text(e.toString(),style: myStyle(20),));
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }
                              
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width /2,
                              height:  45,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: GradientColors.beautifulGreen,
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                             child: Center(
                               child: Text(
                                 "SIGN IN",
                                 style: myStyle(25, Colors.white),) ,),
                            ),
                          ),

                    InkWell(
                   child:Container(
                    child: Row(
                    children: <Widget>[
                      Text('Do not have account?'),
                      TextButton(
                        style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(11.0),
                    primary: Colors.blue,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          
                          Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                ))
            )            
            ],
                        ),
                      ),
                  
                  
                ),
                
              ],
            ),      
    );
  }
}