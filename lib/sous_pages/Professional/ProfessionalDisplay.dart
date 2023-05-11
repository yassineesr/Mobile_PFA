import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/pages/ProfessionalProfilePage.dart';

class ProfessionalDisplay extends StatefulWidget {
  const ProfessionalDisplay({super.key});

  @override
  State<ProfessionalDisplay> createState() => _ProfessionalDisplayState();
}

class _ProfessionalDisplayState extends State<ProfessionalDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information display'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () { 
              Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfessionalProfilePage()),
                );


           },

          icon: Icon(Icons.home),

          



        ),

      ),
      body: Container(
        alignment: Alignment.topCenter,

            child: Column(
          
          
                    children: [
                    
                      Text(
              'Professional Information:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              'Nom: $nom_global\n'
              'Prenom: $prenom_global\n'
              'Email: $email_global_Profs\n'
              'Numero: $num_global_Profs\n'
              'Addresse: $adr_global_Profs\n'
              'Image: ',



              style: TextStyle(
                fontSize: 20,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.0),
            Container(
              width: 300,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: FileImage(File(image2.path)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          
          
          
                    
            
            ]
            
            
            )
            )
      
      
      );
  }
}