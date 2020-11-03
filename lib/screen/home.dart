import 'package:flutter/material.dart';



class MyHome extends StatefulWidget {



   

  @override

  _MyHomeState createState() => _MyHomeState();

}



class _MyHomeState extends State<MyHome> {

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Home Page'),

        

    ),

    body: Center(
      child: Container(
       height: 660,
       width: 400,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/linux.jpg'),fit:BoxFit.cover)
      ),
      child: Container(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

          Material(

            color: Colors.lightBlue,

            borderRadius: BorderRadius.circular(10),

            elevation: 10,

            child: MaterialButton(

              minWidth: 200,

              height: 40,

              

              child: Text('Register'), 

              onPressed: (){

            print('going to registration page');

                Navigator.pushNamed(context, "reg");

          },

          ),

          ),



            SizedBox(height: 40,),



          Material(

            color: Colors.lightBlue,

            borderRadius: BorderRadius.circular(10),

            elevation: 10,

            child: MaterialButton(

              minWidth: 200,

              height: 40,

              

              child: Text('Login'), 

              onPressed: (){

            print('going to registration page');

                Navigator.pushNamed(context, "log");

          },

          ),

          ),  

        ],

        ),

      )),

    ),

    );

  }

}