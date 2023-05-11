import 'package:flutter/material.dart';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/sous_pages/CurrentLocSousPage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'HomePage.dart';

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({super.key});

  @override
  State<CurrentLocationPage> createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
  String latitude = '';
  String longitude = '';
  String qrdata = '';
  String myGlobalString = '';
  bool showQRCode = false;
  /* final formkey=GlobalKey<FormState>();
    final scaffoldkey=GlobalKey<ScaffoldState>();
    final nomController=TextEditingController();
    final emailController=TextEditingController();
    final numController=TextEditingController();
    late final List<String> infos2=[];
    String qrdata='';
    String myGlobalString = '';
    bool showQRCode = false;

     void dispose(){
       super.dispose();
        
      nomController.dispose();
      emailController.dispose();
      numController.dispose();

    }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Current Location'),
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
            child: Column(
          children: [
            Text(
              'Personal Information:',
              textScaleFactor: 2,
            ),
            SizedBox(height: 15.0),
            Text(
              ' nom: $nom_global \n prenom: $prenom_global \n email: $email_global \n numero: $num_global ',
              textScaleFactor: 2,
              textAlign: TextAlign.justify,
            ),
            ElevatedButton(
              onPressed: getLocation,
              child: const Text('get location'),
            ),
            ElevatedButton(
              onPressed: () {
                String phoneNumber = "";
                String email = "";
                String nom1 = "";
                String prenom1 = "";

                setState(() {
                  nom1 = nom_global;
                  prenom1 = prenom_global;
                  email = email_global;
                  phoneNumber = num_global;
                });

                setState(() {
                  qrdata =
                      "$nom1 $prenom1 $email $phoneNumber $latitude $longitude";
                });

                setState(() {
                  showQRCode = !showQRCode;
                });
              },
              child: Text('qr code'),
            ),
            Visibility(
              visible: showQRCode,
              child: QrImage(
                backgroundColor: Colors.grey,
                data: qrdata,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrentLocSousPage()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    child: Icon(Icons.account_circle,
                        size: 40.0, color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  Text('Current Profile', style: TextStyle(fontSize: 18.0)),
                ],
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ))

        /*
  
      child: Container(
          margin: const EdgeInsets.all(20),
            child :Form(
              key: formkey,
              child: Column(
                  children: [
                    Container( 
                      margin: const EdgeInsets.all(10),

                      child: TextFormField( 
                      
                          decoration: const InputDecoration(
                          labelText: 'Nom',
                          
                          border: OutlineInputBorder()
                          
                      ),

                              validator: (value) { 
                                if (value==null || value.isEmpty){
                                    return 'Veuillez remplir le champ';

                                }
                              
                              
                              },
                              controller: nomController,
                              
                    ),
                     ),

                    Container( 
                      margin: const EdgeInsets.all(10),
                      child: TextFormField( 
                      
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          
                          border: OutlineInputBorder()
                      ),
                           validator: (value) { 
                                if (value==null || value.isEmpty){
                                    return 'Veuillez remplir le champ';

                                }
                              
                              
                              },
                              
                          controller: emailController,

                    ),
                     ),
                    

                    Container( 
                      margin: const EdgeInsets.all(10),
                      child: TextFormField( 
                      
                      decoration: const InputDecoration(
                          labelText: 'Numero',
                          
                          border: OutlineInputBorder()
                      ),
                                 validator: (value) { 
                                if (value==null || value.isEmpty){
                                    return 'Veuillez remplir le champ';

                                }
                              
                              
                              },
                              
                            controller: numController,

                    ),
                     ),

                  ElevatedButton(onPressed: getlocation , child: const Text('get location'), ),

                   ElevatedButton(
                        
                        onPressed: () {
                          
                          if (formkey.currentState!.validate()){
                            final nomvalue=nomController.text;
                            final emailvalue=emailController.text;
                            final numvalue=numController.text;
                            


                             ScaffoldMessenger.of(context).showSnackBar(

                                const SnackBar(content: Text("Correct"))

                             );
                             FocusScope.of(context).requestFocus(FocusNode());//clavier goes down

                             print('nom: '+nomvalue);
                             print('email: '+emailvalue);
                             print('num: '+numvalue);
                             print('latitude: '+latitude);
                            print('longitude: '+longitude);

                            List<String> infos = [nomvalue, emailvalue, numvalue,latitude,longitude];
                                 List infos2=List.from(infos);


                                 setState(() {
                                       qrdata='$nomvalue $emailvalue $numvalue $latitude $longitude';
                                       
                                            });
                                         }
                                setState(() {
                             showQRCode = !showQRCode;
                                           });
                           


                         },
                        child: const Text('qr code')
                        
                        
                        ),
                  
                            Visibility(
                              visible: showQRCode,
                              child:QrImage(
                                backgroundColor: Colors.grey,
                                  data: qrdata,
                                      version: QrVersions.auto,
                                        size: 200.0,
                                  
                                        
                                
                              ),    )    
                            
              
                  
                  ],
               

              ),

            )


        )




      ),
    */

        );
  }

/*void getlocation() async{

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude=position.latitude.toString();
      longitude=position.longitude.toString();
       print(latitude);
      print(longitude);
      ScaffoldMessenger.of(context).showSnackBar(

                                const SnackBar(content: Text("location recupere"))

                             );
                             FocusScope.of(context).requestFocus(FocusNode());//clavier goes down
  }






*/
  void getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Handle the case where the user does not grant permission
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle the case where the user has previously denied permission
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Location retrieved")));
  }
}
