import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/HomePage.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
var qrResult='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
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
       child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  ElevatedButton(onPressed: scanQrcode, child: const Text('Scan qr')),

                  const SizedBox(height: 30,),


                  Text(qrResult),






              ],










        ),




      ));
  }



void scanQrcode() async{

        final qrc = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);

        setState(() {
          qrResult=qrc;


        });




}





}