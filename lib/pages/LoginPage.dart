import 'dart:convert';
import 'dart:developer';
import 'package:flutter_application_3/pages/HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/userModel.dart';

import 'package:flutter_application_3/pages/services.dart';

import '../global_variables/global_variables.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}



Future<userModel> LoginPages1(
    String userName, String email, String password, BuildContext context) async {
  var url = "http://localhost:8080/comptes/ajouter";
  var response = await http.post(
    url as Uri,
    headers: <String, String>{
      "Content-Type": "application/json"
    },
    body: jsonEncode(<String, String>{
      "username": userName,
      "email": email,
      "password": password,
    }),
  );

  // Handle response and return a userModel instance
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    var user = userModel.fromJson(jsonResponse);
    return user;
  } else {
    // Handle error response
    throw Exception('Failed to add user: ${response.statusCode}');
  }
}



Service service = Service();

  TextEditingController firstController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController loginMailController = TextEditingController();
TextEditingController passLoginController = TextEditingController();
//usrname=loginMailController.text;
//usrnam

class _LoginPageState extends State<LoginPage> {

  void _performLogin () async
  { 
    
     print("hello 1");
     await service.fetchData() ;
    
    print("hello 2");
    print("doneeUser:");
    //print(doneeUser);

    print("hello");

    print("liste compte 2::");
    print(ListeComptesUsers);

    int a=0;
      for (var user in ListeComptesUsers) {
        print("for");
        print(user['email']);
  if (user['email'] == loginMailController.text && user['password'] == passLoginController.text) {
          globalID = user['idCompte'];
          usrname=user['username'];
          mailUser=user['email'];
          a=1;
           //break;
  }
}
  
  if (/*"ali" == emailController && "ali"== passController*/ a==1)
  {
     Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );

  }


 
 
  }
 void _performSignup()  {
    
    print("sign");
    service.saveUser(firstController.text,
     emailController.text, passController.text);

      Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );


  }


  bool isLoginPage = true; // Variable to track the current page

  void togglePage() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLoginPage
            ? 'Login'
            : 'Sign Up'), // Change app bar title based on the current page
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            isLoginPage
                ? _buildLoginForm()
                : _buildSignUpForm(), // Conditionally display login or sign-up form
            SizedBox(height: 20),
            ElevatedButton(
              /*onPressed: (){
                service.saveUser(firstController.text,
                    emailController.text, passController.text);
              },*/
                 onPressed: isLoginPage ? _performLogin : _performSignup,
              child: Text(isLoginPage ? 'Login' : 'Sign up'),
            ),
            
            
            
            TextButton(
              onPressed: togglePage,
              child: Text(isLoginPage
                  ? 'Don\'t have an account? Sign up.'
                  : 'Already have an account? Login.'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        TextFormField(
          controller: loginMailController,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
            hintText: 'Enter your email',
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: passLoginController,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
            hintText: 'Enter your password',
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        TextFormField(
           controller: firstController,
          decoration: InputDecoration(
            labelText: 'First Name',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(),
            hintText: 'First Name',
          ),
        ),
        SizedBox(height: 20),
    
        TextFormField(
           controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
            hintText: 'Enter your email',
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
           controller: passController,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
            hintText: 'Enter your password',
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
            hintText: 'Confirm your password',
          ),
        ),
      ],
    );
  }
}






class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    required this.title,
    required this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
       // style: Theme.of(context).textTheme.title,
      ),
      actions: this.actions,
      content: Text(
        this.content,
       // style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}



