import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/HomePage.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../global_variables/global_variables.dart';
import '../sous_pages/PersonalSousPage.dart';

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

  String _qrCodeData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Profile'),
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
      body:Center(
          child:Column(
            children: [
                   Text(' nom: $nom_global \n prenom: $prenom_global \n email: $email_global \n numero: $num_global',
                   textScaleFactor: 2,
                   textAlign: TextAlign.justify,
                   
                   ),
                  ElevatedButton(
                onPressed: _generateQrCodefromGolbal,
                child: Text('Generate QR Code'),
              ),
              SizedBox(height: 16.0),
             
                QrImage(
                  data: _qrCodeData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),

                InkWell(
          onTap: () {
            Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalSousPage()),
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
              Text('Personal Profile', style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
              SizedBox(height: 16.0),
             

            ],


          )
           

      )
      
      
      /* SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                 
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _generateQrCode,
                child: Text('Generate QR Code'),
              ),
              SizedBox(height: 16.0),
             
                QrImage(
                  data: _qrCodeData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
            ],
          ),
        ),
      ),*/
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

      setState(() {
        nom1=nom_global;
        prenom1=prenom_global;
        email=email_global;
        phoneNumber=num_global;
      });
      
      setState(() {
        _qrCodeData = "$nom1 $prenom1 $email $phoneNumber";
      });
    
  }
  }
