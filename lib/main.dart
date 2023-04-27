library my_globals;


import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/HomePage.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickLinker',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.green,
        ),
      ),
      home: HomePage(),
    );
  }
}



     





class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Contact Page'),
),
    );
  }
}

