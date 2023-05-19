import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/pages/LoginPage.dart';
import 'package:http/http.dart' as http;

class Service {
  //create the method to save user

  Future<http.Response> saveUser(
      String username, String email, String password) async {
    //create uri
    var uri = Uri.parse("http://pda-env.eba-m3ac3t3q.eu-north-1.elasticbeanstalk.com/comptes/ajouter");
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};
    //body
    Map data = {
      'username': '$username',
      'email': '$email',
      'password': '$password',
    
    };
    //convert the above data into json
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    print("${response.body}");

    return response;
  }
/*
  Future<http.Response> GetListUsers() async{
       
      // var uri = Uri.parse("http://localhost:8080/comptes/liste");
       var data = await http.get('http://localhost:8080/comptes/liste');
       var jsonData = json.decode(data.body);
       
       List<LoginPage> usrers = [];
       
     
       for (var e in jsonData) {
      
          usrers.add(e);
    
      
    }
    return usrers;
      }
*/
/*
  Future<List<Map>> fetchItems() async {
    List<Map> items = [];

    //--Get the data from the API
    http.Response response =
        await http.get(Uri.parse('http://localhost:8080/comptes/liste'));

    if (response.statusCode == 200) {
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      List data = jsonDecode(jsonString);
      items= data.cast<Map>();
    }

    return items;
  }
*/
/*

// GET function
Future<List<dynamic>> fetchDataFromSpringBoot() async {

  print ("fetchDataFromSpringBoot");
  var url = Uri.parse('http://localhost:8080/comptes/liste');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Parse the response body
    var data = jsonDecode(response.body);
    
    // Access the desired data fields
    var username= data['username'];
    var email= data['email'];
     var password= data['password'];
    // ... access other fields as needed
    print("nom User : "+ username);
    // Return the data
    return [username, email, password]; // Modify this line based on your data structure

  } else {
    // Handle the error response
    print('Request failed with status: ${response.statusCode}');
    return []; // Return an empty list or handle the error case accordingly
  }
}*/

Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('http://pda-env.eba-m3ac3t3q.eu-north-1.elasticbeanstalk.com/comptes/liste'));

  print("fetch data 200: ");
  if (response.statusCode == 200) {
    // Successful request
    final data = jsonDecode(response.body);
    print("fetch data: ");
    print(data);
    ListeComptesUsers = data;
  print("ListeComptesUsers ");
  print(ListeComptesUsers);

    return data;
  } else {
    // Error occurred
    print("error data: ");
    throw Exception('Failed to fetch data');
  }
}

Future<http.Response> savePersonnalProfile(
      String nom, String prenom, String email_,int idc, String adr,String tel) async {
    //create uri
    print("hello from profile: "+adr);
    var uri = Uri.parse("http://pda-env.eba-m3ac3t3q.eu-north-1.elasticbeanstalk.com/profils/ajouter");
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};
    //body
    Map data = {
      'nom': '$nom',
      'prenom': '$prenom',
      'address': '$adr',
      'idc':'$idc',
      'tel':'$tel',
      'email':'$email_',
      'ddn':'1990-12-12',
      'lien':'facebook',
      

    
    };
    //convert the above data into json
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    print("${response.body}");

    return response;
  }

Future<List<dynamic>> fetchDataPersoForm() async {
  final response = await http.get(Uri.parse('http://pda-env.eba-m3ac3t3q.eu-north-1.elasticbeanstalk.com/profils/liste'));

  print("fetch data profile 200: ");
  if (response.statusCode == 200) {
    // Successful request
    final data = jsonDecode(response.body);
    print("fetch data: ");
    print(data);
    ListeProfils = data;
  print("ListeComptesUsers ");
  print(ListeComptesUsers);

    return data;
  } else {
    // Error occurred
    print("error data: ");
    throw Exception('Failed to fetch data');
  }
}






}//service } fermenate


