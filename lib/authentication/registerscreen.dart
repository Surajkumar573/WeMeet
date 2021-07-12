import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import '../styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  
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
                      margin: EdgeInsets.only(left:30,right:30,),
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
                        
                         backgroundImage: AssetImage('images/signup.jpg')
                         ),
                          ),
//enter the email address                       
                          SizedBox(height:12,),
                          Container(
                            width: MediaQuery.of(context).size.width /1.7,
                          
                            child: TextField(
                         
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
    //enter the password
                          SizedBox(height:12),
                          Container(
                            width: MediaQuery.of(context).size.width /1.7,
                            child: TextField(
                                style: myStyle(18,Colors.black),
                                controller: passwordcontroller,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: Icon(Icons.lock),
                                  hintStyle: myStyle(20,Colors.grey,FontWeight.w700)
                                ),      
                          
                          ),
                          ),
   //enter the username                       
                          SizedBox(height:12),
                          Container(
                            width: MediaQuery.of(context).size.width /1.7,
                            child: TextField(
                                style: myStyle(18,Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                controller: usernamecontroller,
                                decoration: InputDecoration(
                                  hintText: "Username",
                                  prefixIcon: Icon(Icons.person),
                                  hintStyle: myStyle(20,Colors.grey,FontWeight.w700)
                                ),      
                          
                          ),
                          ),
                          SizedBox(height:26,),
                          InkWell(
                            onTap: () {
                             
                              try {
                                 FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: emailcontroller.text, 
                                password: passwordcontroller.text).then((signeduser){
                                usercollection.doc(signeduser.user!.uid).set({
                                  'username': usernamecontroller.text,
                                  'email': emailcontroller.text,
                                  'password': passwordcontroller.text,
                                  'uid': signeduser.user!.uid,
                                });
                                });
                                Navigator.pop(context);
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
                                gradient: LinearGradient(colors: GradientColors.pink,
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              
                             child: Center(
                                
                               child: Text(
                                 "SIGN UP",
                                 style: myStyle(25, Colors.white),) ,),
                            ),
                            
                          ),
                            
                        ],
                        ),
                      ),
                  
                )
              ],
            ),      
    );
  }
}