import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;



class MyChat extends StatefulWidget {

  @override

  _MyChatState createState() => _MyChatState();

}



class _MyChatState extends State<MyChat> {

  var fs = FirebaseFirestore.instance;

  var authc = FirebaseAuth.instance;

  

  String chatmsg;

  var cmd;

  var webdata;

  

  myweb(cmd)async{

  var url = "http://192.168.43.164/cgi-bin/command.py?x=${cmd}";

  var r = await http.get(url);

  

  setState(() {

   webdata = r.body;  

  });



 print(webdata);



}



  @override

  Widget build(BuildContext context) {

    var deviceWidth = MediaQuery.of(context).size.width;

    var signInuser  = authc.currentUser.email;

    return Scaffold(

      appBar: AppBar(

        title: Text("Linux Terminal"),

        actions: <Widget>[

          IconButton(icon: Icon(Icons.close), 

          onPressed: () async{

            print("Sign off");

           await authc.signOut();

           Navigator.pushNamed(context, "log");

          }),

        ],

      ),

      body: Container(

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

              Container(width: 150,

              height: 100,

              alignment: Alignment.bottomCenter,

              //color: Colors.red,

              child: Image(image: AssetImage('assets/redhat.jpg')),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/redhat.jpg'),),
              ),

              ),

               SizedBox(height: 20,),

              Text(webdata ?? "Write your linux command here....."),

               SizedBox(height: 20,),

        Row(
         

          children: [
            Container(

            

              width: deviceWidth * 0.70,
               
              child : SingleChildScrollView(
              child: TextField(

                decoration: InputDecoration(hintText: "[root@localhost]# ",

                 border: OutlineInputBorder(


                  borderRadius: BorderRadius.circular(10),

                ),

                ),

                

                onChanged: (value){

                    cmd = value;

              }

              )),

            ),

            Container(

              width: deviceWidth * 0.20,
              child: SingleChildScrollView(
              child: FlatButton( 

                child: Icon(Icons.send,color: Colors.blue),

              onPressed: () async {

                myweb(cmd);

                 //var fsconnect = FirebaseFirestore.instance;

                 fs.collection("chat").add({

                  "Command": cmd,

                  "Output": webdata,

                });

              },

              )),

            ),

          ],

        ),

      ]

      ),

    ),

    );

  }

}