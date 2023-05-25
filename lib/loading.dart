import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/LoginPage.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override

 
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),));
    
  }
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,


          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                     Image.asset("assets/logo.jpg",
                     height: 200,
                     width: 200,
                     
                     
                     ),

                    SizedBox(height: 20,),
                     Text('WELCOME'),

                     
                     SizedBox(height: 100,),
                   CircularProgressIndicator(),

              ],

              





          ),

           


      ),
      
    );
  }
}