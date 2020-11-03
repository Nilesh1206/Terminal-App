import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';



class MyLog extends StatefulWidget {

  @override

  _MyLogState createState() => _MyLogState();

}



class _MyLogState extends State<MyLog> {

  var authc = FirebaseAuth.instance;

  String email;

  String password;

  bool sspin = false;

 

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text("Login Page"),

      ),

      body: ModalProgressHUD(

        inAsyncCall: sspin,

              child: Center(
          child : Container(
           height: 660,
           width: 400,
           decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage('assets/hack.jpg'),fit: BoxFit.cover),

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

                decoration: InputDecoration(hintText: "Enter Your Email",

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
                 
  
                  
                  print(email);

                  print(password);

                var signIn = await authc.signInWithEmailAndPassword(email: email, password: password);

                print(signIn);



                 if (signIn != null) {

                       Navigator.pushNamed(context, "chat");

                         setState(() {

                    sspin = false;

                  });

                  

                     }

                },

                

                child: Text('Login',style: TextStyle(),),

                ),

              ],

            ),

          )),

        ),

      ),

    );

  }

}