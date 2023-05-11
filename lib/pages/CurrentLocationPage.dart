import 'package:flutter/material.dart';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/sous_pages/Current/CurrentDisplay.dart';
import 'package:flutter_application_3/sous_pages/Current/CurrentLocSousPage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'HomePage.dart';

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({super.key});

  @override
  State<CurrentLocationPage> createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
  
  String qrdata = '';
  String myGlobalString = '';
  bool showQRCode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Current Location'),
          centerTitle: true,
          
        ),
        body:Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

          children: [
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
                  email = email_global_Cur;
                  phoneNumber = num_global_Cur;
                });

                setState(() {
                  qrdata =
                      "$nom1 $prenom1 $email $phoneNumber $latitude_Cur $longitude_Cur";
                });

                setState(() {
                  showQRCode = !showQRCode;
                });
              },
              child: Text('qr code'),
            ),

            SizedBox(
              height: 10,
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
                               MaterialPageRoute(builder: (context) => CurrentLocSousPage()),
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
                               MaterialPageRoute(builder: (context) => CurrentDisplay()),
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
        latitude_Cur=position.latitude.toString();
      longitude_Cur=position.longitude.toString();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Location retrieved")));
  }
}
