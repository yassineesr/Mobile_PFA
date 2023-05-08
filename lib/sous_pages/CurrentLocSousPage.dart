import 'package:flutter/material.dart';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/pages/CurrentLocationPage.dart';

class CurrentLocSousPage extends StatefulWidget {
  const CurrentLocSousPage({super.key});

  @override
  State<CurrentLocSousPage> createState() => _CurrentLocSousPageState();
}

class _CurrentLocSousPageState extends State<CurrentLocSousPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
 
  String _qrCodeData = "";
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CurrentSousPage'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () { 
              Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrentLocationPage()),
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




  void _generateQrCodefromGolbal() {
   

      setState(() {
        
        email_global=_emailController.text;
        num_global=_phoneController.text;
        
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