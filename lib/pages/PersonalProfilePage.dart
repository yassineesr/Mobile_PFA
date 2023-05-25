// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/pages/HomePage.dart';
import 'package:flutter_application_3/pages/LoginPage.dart';
import 'package:flutter_application_3/sous_pages/Personal/PersonalDisplay.dart';
import 'package:flutter_application_3/sous_pages/Personal/PersonalSousPage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';




class PersonalProfilePage extends StatefulWidget {
  const PersonalProfilePage({super.key});

  @override
  State<PersonalProfilePage> createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();


void _profileInfo() async
  { 
    
     print("hello profile 1");
     await service.fetchDataPersoForm() ;
    
    
    //print(doneeUser);

    print("hello");

    print("liste profils 2::");
    print(ListeProfils);

    int a=0;
      for (var user in ListeProfils) {
        print("for");
        print(user['email']);
  if (user['idc'] == globalID) {
          email_global = user['email'];
          num_global=user['tel'];
          adr_global=user['address'];
          nom_global_pers=user['nom'];
          prenom_global_pers=user['prenom'];
          a=1;
           //break;
  }
}
   
  }

  //_profileInfo();



  String _qrCodeData = "";
   bool showQRCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
         
        ),
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: _generateQrCodefromGolbal,
              child: Text('Generate QR Code'),
            ),
            SizedBox(height: 15.0),

            Visibility(
              visible: showQRCode, 
              
              child: QrImage(
              data: _qrCodeData,
              version: QrVersions.auto,
              size: 200.0,
            ),
            ),
            
            
          

            

          ],
        )), 
        
        bottomNavigationBar:  Container(
          color: Colors.green,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GNav(
               gap: 8, // the tab button gap between icon and text 
               backgroundColor: Colors.green,
               color: Colors.white,
               activeColor: Colors.white, // selected icon and text color
               tabBackgroundColor: Colors.grey, // selected tab background color
               padding: EdgeInsets.all(16),
               selectedIndex: 1,
               
               
               
              tabs:  [
                
                
            
                GButton(
                  icon: Icons.info,
                  text: 'infos',
                  onPressed: () {


                    _profileInfo();Future.delayed(Duration(milliseconds: 500), () {
                             Navigator.pop(context);
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => PersonalSousPage()),
                             );
                           });
                      
              },
                  
                  
                  ),



                      GButton(
                  icon: Icons.home,
                  text: 'home',
                  onPressed: () {
                    
                      Future.delayed(Duration(milliseconds: 500), () {
                             Navigator.pop(context);
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => HomePage()),
                             );
                           });
            },
                  
                  
                  
                  ),
          
          
                  GButton(
                  icon: Icons.list,
                  text: 'Display',
                   onPressed: () { 
_profileInfo();
                     Future.delayed(Duration(milliseconds: 500), () {
                             Navigator.pop(context);
                             
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => PersonalDisplay()),
                             );
                           
                           });
                      
              },

              
                  
                  
                  
                  ),
          
          
          
          
            ],
          
          
          
          
            ),
          ),
        ),
        
        
        );
  }

  void _generateQrCode() {
    if (_formKey.currentState!.validate()) {
      String phoneNumber = _phoneController.text;
      String email = _emailController.text;
      String address = _addressController.text;
      print(email);
      print(address);
      setState(() {
        _qrCodeData = "$phoneNumber $email $address";
      });
    }
  }

  void _generateQrCodefromGolbal() {
    String phoneNumber = "";
    String email = "";
    String nom1 = "";
    String prenom1 = "";
    String adress1 = "";

    setState(() {
      nom1 = nom_global_pers;
      prenom1 = prenom_global_pers;
      email = email_global;
      phoneNumber = num_global;
      adress1=adr_global;
    });

    setState(() {
      _qrCodeData = "$nom1 $prenom1 $email $phoneNumber $adress1";
    });

       setState(() {
                  showQRCode = !showQRCode;
                });
    


  }




  
}
