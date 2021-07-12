import 'package:flutter/material.dart';
import 'package:flutter_application_1/videoconference/createmeeting.dart';
import 'package:flutter_application_1/videoconference/joinmeeting.dart';

import '../styles.dart';
class VideoConferenceScreen extends StatefulWidget {
  const VideoConferenceScreen({ Key? key }) : super(key: key);

  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;
   
  buildtab(String name){
    return Container(
      width: 150 ,
      height:  50,
      child: Card(
        child:Center(
          child: Text(name, style: myStyle(15, Colors.black,FontWeight.w700)) ,
          ),
      ),);
  }

  @override
  void initState() {
    super.initState();
   tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title:Text("WeMeet", style: myStyle(20, Colors.white,FontWeight.w700),
      ),
      bottom: TabBar(
        controller: tabController,
        tabs: [
buildtab("Join meeting"),    //to switch to join meeting page
buildtab("Create meeting")   //to switch to create meeting page
        ],
      ),
    ),
    body: TabBarView(controller: tabController, children: [
      
      JoinMeeting(),
      CreateMeeting(),
    ]),
    );
  }
}