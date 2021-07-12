import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:uuid/uuid.dart';
class CreateMeeting extends StatefulWidget {
  const CreateMeeting({ Key? key }) : super(key: key);

  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
 //to create the meeting code
 String code = "";
 createcode(){
   setState(() {
     code = Uuid().v1().substring(0, 6);
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      body: Column(     
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          child: CircleAvatar(
            radius: 70,
            
          backgroundImage: AssetImage('images/code.png')
          ),
        ),
          Container(
            margin: EdgeInsets.only(top: 18),
            child: Text("Create Meeting Code",
            style: myStyle(29, Colors.blueAccent),
            textAlign: TextAlign.center),
            
          ),
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Code:", style:myStyle(30),),
            Text(code,style: myStyle(30, Colors.purple,FontWeight.w700),)
          ],),
          SizedBox(height: 24),
            InkWell(
              onTap: ()=> createcode(),
            child: Container(
              width: MediaQuery.of(context).size.width /2,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: GradientColors.violet),
                 borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text("Create Code", style: myStyle(20,Colors.white),)
              ),
            ),
          )
        ],
      ),
      
    );
  }
}