import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';



class MyReg extends StatefulWidget {

  @override

  _MyRegState createState() => _MyRegState();

}



class _MyRegState extends State<MyReg> {



var authc = FirebaseAuth.instance;

  

String email;

String password;

bool sspin = false;



  @override

  Widget build(BuildContext context) {

    var outlineInputBorder = OutlineInputBorder();

    return Scaffold(

      appBar: AppBar(title: Text("Registration Page"),

      ),

      body: ModalProgressHUD(

        inAsyncCall: sspin,

              child: Center(
          child: Container(
             height: 660,
             width: 400,
             decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage('assets/hack.jpg'),fit: BoxFit.cover)
             ),
          child: Container(

            width: 300,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                TextField(

                  keyboardType: TextInputType.emailAddress,

                  onChanged: (value){

                  email = value;

                },

                decoration: InputDecoration(

                  hintText: "Enter Your Email",

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(10),

                ),

                ),

                

                ),

                SizedBox(height: 20,),



                TextField(

                  obscureText: true,

                  onChanged: (value){

                     password = value;

                  },

                  decoration: InputDecoration(hintText: "Enter Your Password",

                  border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(10),

                ),

                  ),

                ),

                SizedBox(height: 20,),

                RaisedButton(onPressed: ()  async {

                    setState(() {

                      sspin = true;

                    });



                  print(email);

                  print(password);

                  var user = await authc.createUserWithEmailAndPassword(

                     email: email, password: password);

                     print(user);



                     if (user.additionalUserInfo.isNewUser == true) {

                       Navigator.pushNamed(context, "log");

                         setState(() {

                      sspin = false;

                    });

                     }

                },

                child: Text('Register'),

                ),

              ],

            ),

          )),

        ),

      ),

    );

  }

}