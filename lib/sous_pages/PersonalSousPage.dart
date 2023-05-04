import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/HomePage.dart';
import 'package:flutter_application_3/pages/PersonalProfilePage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../global_variables/global_variables.dart';


class PersonalSousPage extends StatefulWidget {
  const PersonalSousPage({super.key});

  @override
  State<PersonalSousPage> createState() => _PersonalSousPageState();
}

class _PersonalSousPageState extends State<PersonalSousPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();


  String _qrCodeData = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PersonalSousPage'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () { 
              Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalProfilePage()),
                );


           },
          icon: Icon(Icons.home),



        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
               

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

               

              ElevatedButton(
                onPressed: _generateQrCodefromGolbal,
                child: Text('Valider'),
              ),
                
            ],
          ),
        ),
      ),
    );
  }

/*  void _generateQrCode() {
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
*/


  void _generateQrCodefromGolbal() {
   

      setState(() {
        
        email_global=_emailController.text;
        num_global=_phoneController.text;
        adr_global=_addressController.text;
      });
      
      setState(() {
        _qrCodeData = "$nom_global $prenom_global $email_global $num_global $adr_global";
      });
    ScaffoldMessenger.of(context).showSnackBar(

                                const SnackBar(content: Text("Valide"))

                             );
     FocusScope.of(context).requestFocus(FocusNode());//clavier goes down
  }
}

