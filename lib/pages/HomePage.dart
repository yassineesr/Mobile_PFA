import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/CurrentLocationPage.dart';
import 'package:flutter_application_3/pages/OtherPage.dart';
import 'package:flutter_application_3/pages/PersonalProfilePage.dart';
import 'package:flutter_application_3/pages/ProfessionalProfilePage.dart';
import 'package:flutter_application_3/pages/QrScanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuickLinker'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
              child: CircleAvatar(
                child: Icon(Icons.contact_mail),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
       
          
           Row(
      
     mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfessionalProfilePage()),
                );
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: 40.0,
                child: Icon(Icons.account_circle,size: 80.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Text('Professional Profile', style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalProfilePage()),
                );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.0,
                child: Icon(Icons.account_circle,size: 80.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Text('Personal Profile', style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
      ],
    ),

 SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
      
      children: [
        InkWell(
          onTap: () {

            Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrentLocationPage()),
                );
            
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: 40.0,
                child: Icon(Icons.account_circle,size: 80.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Text('Current Location', style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
        InkWell(
          onTap: () {


            Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtherPage()),
                );
            
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: 40.0,
                child: Icon(Icons.account_circle,size: 80.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Text('other', style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),

      
      
      ],
    
        
        ),



        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
      
      children: [
        InkWell(
          onTap: () {

            Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QrScanner()),
                );
            
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: 40.0,
                child: Icon(Icons.qr_code_scanner_rounded,size: 80.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Text('Qr code scanner', style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
      
      
      ],
    
        
        ),


        
        

      
  ])
   ), );
  }
}
