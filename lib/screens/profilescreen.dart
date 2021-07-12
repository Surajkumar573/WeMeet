import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import '../styles.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = '';
  bool dataisthere = false;
  TextEditingController usernamecontroller = TextEditingController();
 
  @override
  void initState() {
    
    super.initState();
    getuserdata();
  }
//to get the user data
  getuserdata()async{
  
  DocumentSnapshot userdoc = await usercollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    Object? temp = userdoc.data();
    setState(() {
      if(temp!= null){
username = (temp as Map)['username'];

      }
      
      dataisthere = true;
    });
  }
//to edit the profile of user
  editprofile()async{
    usercollection
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .update({
      'username': usernamecontroller.text,
    });
    setState(() {
      username = usernamecontroller.text;
    });
    Navigator.pop(context);
  }

 FirebaseAuth auth = FirebaseAuth.instance;
    
      signOut() async {
        await auth.signOut();
      }

  openeditprofiledialog()async{
    return showDialog(
      context: context,
      builder: (context){
        return Dialog(
          child:Container(
            height: 200,
            child: Column(
              children:[
                //update your username
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 30,right:30),
              child: TextField(
                controller: usernamecontroller,
                style: myStyle(18, Colors.black),
                decoration: InputDecoration(
                  labelText: "Update Username",
                  labelStyle: myStyle(16, Colors.grey)
                ),
              )
              ),
              
              SizedBox(height :40,),
              InkWell(
                onTap: ()=> editprofile(),
                child: Container(
                  width: MediaQuery.of(context).size.width /2,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: GradientColors.cherry)
                  ),
                  child: Center(
                    child: Text("Update Now", style: myStyle(17, Colors.white)),
                  ),
                ),
              )
              
              ],
            ),
          ),
          );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: dataisthere  == false? Center(
        child: CircularProgressIndicator() ,): Stack(
        children: [
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height /2.7,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: GradientColors.orange)
              ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width /6.0,
          top: MediaQuery.of(context).size.height /5.1
          ),
           child: AvatarGlow(
                    endRadius:120,
                     glowColor: Colors.orange,
                     duration: Duration(milliseconds: 2000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: Duration(milliseconds: 50),
                    child: Material(
                  
                    shape: CircleBorder(),
          child:CircleAvatar(
            radius:72,
            backgroundColor: Colors.teal,
           child: CircleAvatar(
            radius: 70,
            
          backgroundImage: AssetImage('images/profile.png')
           )
          ),
                    ),
           ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(height: 230,),
              Text(username,style:myStyle(35, Colors.indigo),
              textAlign: TextAlign.center,
              ),
          //edit your profile
              SizedBox( height:18),
              InkWell(
                onTap: ()=>openeditprofiledialog(),
                child: Container(
                  width: MediaQuery.of(context).size.width /2,
                  height: 45,
              
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: GradientColors.blue),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Edit Profile", style: myStyle(18, Colors.white)),
                  ),
                ),
              ),
              //sign out of application
              SizedBox( height:18),
              InkWell(
                onTap: ()=>signOut(),
                child: Container(
                  width: MediaQuery.of(context).size.width /2,
                  height: 45,              
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: GradientColors.red),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  
                  child: Center(
                    child: Text("Sign out", style: myStyle(18, Colors.white)),
                  ),
                ),
              )
            ],
          ),
        )
        ],
      ),
    );
  }
}