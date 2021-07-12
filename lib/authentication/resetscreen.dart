import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Reset Password'),),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10, top:26),
              child: Center(
              child: Image.asset('images/password.png', height: 220, ),
            ),
                        ),
          Padding(
            
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 11),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(  
                hintText: 'Email Address',
                border: OutlineInputBorder(),
              ),
               onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('Send Request'),
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                },
                
              ),

            ],
          ),

        ],),
    );
  }
}