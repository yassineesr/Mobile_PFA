import 'package:flutter/material.dart';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/pages/CurrentLocationPage.dart';

class CurrentDisplay extends StatefulWidget {
  const CurrentDisplay({super.key});

  @override
  State<CurrentDisplay> createState() => _CurrentDisplayState();
}

class _CurrentDisplayState extends State<CurrentDisplay> {
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
                  MaterialPageRoute(builder: (context) => CurrentLocationPage()),
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
              'Personal Information:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              'Nom: $nom_global\n'
              'Prenom: $prenom_global\n'
              'Email: $email_global_Cur\n'
              'Numero: $num_global_Cur\n'
              'latitude: $latitude_Cur\n'
              'longitude: $longitude_Cur\n',
              



              style: TextStyle(
                fontSize: 20,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            
          
          
          
                    
            
            ]
            
            
            )
            )
      
      
      );
  }
}