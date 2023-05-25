

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/pages/LoginPage.dart';
import 'package:flutter_application_3/pages/PersonalProfilePage.dart';

class PersonalDisplay extends StatefulWidget {
  const PersonalDisplay({super.key});

  @override
  State<PersonalDisplay> createState() => _PersonalDisplayState();
}



class _PersonalDisplayState extends State<PersonalDisplay> {

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



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information display'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () { _profileInfo();
              Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalProfilePage()),
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
              'Profile Information:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
            
            Text(
              'Nom: $nom_global_pers\n'
              'Prenom: $prenom_global_pers\n'
              'Email: $email_global\n'
              'Numero: $num_global\n'
              'Addresse: $adr_global\n'
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
                  image: FileImage(File(image1.path)),
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