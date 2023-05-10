
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/sous_pages/ProfessionalSousPage.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Profile'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () { 
              Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );


           },
          icon: Icon(Icons.home),



        ),
      ),
      body: Center(
          child:Column(
            children: [

              Text('Personal Information:',
                   textScaleFactor: 2,
                   
                   ),
                   SizedBox(height: 15.0),

                   Text(' nom: $nom_global \n prenom: $prenom_global \n email: $email_global_Profs \n numero: $num_global_Profs \n adresse: $adr_global_Profs',
                   textScaleFactor: 2,
                   textAlign: TextAlign.justify,
                   
                   ),

                      Container(
                    width: 300,
                    height: 170,
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      image: DecorationImage(
                        image: FileImage(File(image2.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                        ),
                        SizedBox(height: 10.0),
                  ElevatedButton(
                onPressed: _generateQrCodefromGolbal,
                child: Text('Generate QR Code'),
              ),
              SizedBox(height: 15.0),
             
                QrImage(
                  data: _qrCodeData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                SizedBox(height: 20.0),
                InkWell(
          onTap: () {
            Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfessionalSousPage()),
                );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20.0,
                child: Icon(Icons.account_circle,size: 40.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Text('Professional Profile', style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
              SizedBox(height: 16.0),
             

            ],


          )
           

      )
     
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
    
  }



}