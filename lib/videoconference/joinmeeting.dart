// import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class JoinMeeting extends StatefulWidget {
  const JoinMeeting({ Key? key,  }) : super(key: key);

  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}
class _JoinMeetingState extends State<JoinMeeting> {
TextEditingController namecontroller = TextEditingController();
TextEditingController roomcontroller = TextEditingController();
bool isVideoMuted = true;
bool isAudioMuted = true;
String username = '';

 @override
  void initState() {
    
    super.initState();
    getuserdata();
  }
//to get the user's data
  getuserdata()async{
    
    DocumentSnapshot userdoc = await usercollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    Object? temp = userdoc.data();
    setState(() {
       if(temp!= null){
username = (temp as Map)['username'];
      }
      
    });
  }
  //to join the meeting
joinmeeting() async{

try {
  FeatureFlag featureFlag = FeatureFlag();
  featureFlag.welcomePageEnabled = false;
  if(Platform.isAndroid){
    featureFlag.callIntegrationEnabled = false;
  }else if (Platform.isIOS){
featureFlag.pipEnabled = false;
  }

    var options = JitsiMeetingOptions(room: roomcontroller.text)
    ..userDisplayName = namecontroller.text == '' ? username : namecontroller.text
    ..audioMuted  = isAudioMuted
    ..videoMuted  =  isVideoMuted;

  await JitsiMeet.joinMeeting(options);

}catch (e) {
  print ("Error: $e");
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //enter meeeting code
            SizedBox(height: 22),
            Text(
              "Meeting Code",
            style: myStyle(25),
            ),
            SizedBox(height: 15,),
            PinCodeTextField( appContext: context, length: 6, 
            controller: roomcontroller,
            autoDisposeControllers: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline
            ),
            animationDuration: Duration(milliseconds: 300),
            onChanged: (value){},),
            
            //enter the username
             SizedBox(height: 10,),
             TextField(
               controller: namecontroller,
               style: myStyle(20),
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Username",
                 prefixIcon: Icon(Icons.person),
                 labelStyle: myStyle(15) 
                 ),
             ),
             SizedBox(height: 15,),
                          CheckboxListTile(value: isVideoMuted, onChanged: (value){
                            setState(() {
                              isVideoMuted = value!;
                            });
                          },
                          title: Text("Video Muted", style: myStyle(18, Colors.black),),
                          ),
                          SizedBox(height: 15,),
                          CheckboxListTile(value: isAudioMuted, onChanged: (value){
                            setState(() {
                              isAudioMuted = value!;
                            });
                          },
                          title: Text("Audio Muted", style: myStyle(18, Colors.black),),
                          ),
                          SizedBox(height: 16,),
                          Text("Note: You can also customise your settings in the meeting",
                          style: myStyle(16.5, Colors.blueGrey),
                          textAlign: TextAlign.center,
                          ),
                          Divider(
                            height:48,
                            thickness: 3.0,
                          ),

                     InkWell(
                     onTap: ()=> joinmeeting(),
                          child: Container(
                            width: double.maxFinite,
                            height: 64,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: GradientColors.aqua),
                              boxShadow: [BoxShadow(
                        color: Colors.black, blurRadius: 5, offset: Offset(0, 2))]
                            ),
                            child: Center(
                              child: Text("Join Meeting", style: myStyle(20,Colors.white),)
                            ),
                          ),
                        )

                                     ],
                                     ),
                                   )
                                 ),
                                 
                               );
  }
}
             
             