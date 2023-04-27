import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'HomePage.dart';

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({super.key});

  @override
  State<CurrentLocationPage> createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
String latitude= '';
  String longitude='';
   final formkey=GlobalKey<FormState>();
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

    }

    
  void getlocation() async{

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
        //child: _position!=null ? Text('current loc:$_position'): const Text('no location'),
        /*child: Container(
        
          //child: ElevatedButton(onPressed: getlocation, child: const Text('get location'),)
          
          child: Column(
            children: [
              ElevatedButton(onPressed: getlocation, child: const Text('get location'),),
              //ElevatedButton(onPressed: openMap, child: const Text('open location'),),

            ],
          ),
          ),
        */  
        
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
    
      
    );
  }
  }
