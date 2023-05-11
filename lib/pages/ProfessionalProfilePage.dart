
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/sous_pages/Professional/ProfessionalDisplay.dart';
import 'package:flutter_application_3/sous_pages/Professional/ProfessionalSousPage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../main.dart';
import 'HomePage.dart';

class ProfessionalProfilePage extends StatefulWidget {
  @override
  _ProfessionalProfilePageState createState() => _ProfessionalProfilePageState();
}

class _ProfessionalProfilePageState extends State<ProfessionalProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String _qrCodeData = "";
  bool showQRCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Profile'),
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


                    Future.delayed(Duration(milliseconds: 500), () {
                             Navigator.pop(context);
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => ProfessionalSousPage()),
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

                     Future.delayed(Duration(milliseconds: 500), () {
                             Navigator.pop(context);
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => ProfessionalDisplay()),
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





  void _generateQrCodefromGolbal() {
    String phoneNumber = "";
      String email = "";
      String nom1 = "";
      String prenom1 = "";
      String adresse = "";

      setState(() {
        nom1=nom_global;
        prenom1=prenom_global;
        email=email_global_Profs;
        phoneNumber=num_global_Profs;
        adresse=adr_global_Profs;
      });
      
      setState(() {
        _qrCodeData = "$nom1 $prenom1 $email $phoneNumber $adresse ";
      });

       setState(() {
                  showQRCode = !showQRCode;
                });
    
  }



}