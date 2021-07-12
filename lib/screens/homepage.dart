import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profilescreen.dart';
import 'package:flutter_application_1/screens/videoconferencescreen.dart';
import 'package:flutter_application_1/styles.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageoptions =[
VideoConferenceScreen(),
ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        selectedItemColor: Colors.blue,
        selectedLabelStyle: myStyle(17, Colors.blue),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: myStyle(17, Colors.black),
        currentIndex: page,
        onTap: (index){
          setState(() {
            page = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Video Call",
            icon: Icon(Icons.video_call, size: 32),
            ),
            BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person, size: 32),
            )
        ],
        
      ),
      body: pageoptions[page],
      
    );
  }
}