import 'dart:convert';


userModel usermodelJson(String str) =>
  userModel.fromJson(json.decode(str));

String usermodelToJson(userModel data) =>json.encode(data.toJson());

class userModel{


  String userName;

  String email;
  String password;

    userModel({required this.userName, required this.email,required this.password});

    factory userModel.fromJson(Map<String, dynamic> json) => userModel(

      userName: json["userName"],
      email: json["email"],
      password: json["password"],
      
      
    );

    Map<String, dynamic> toJson()=>
    {
       "userName": userName,
      "email": email,
      "password": password,

    };

    String get username => userName;
    String get Email => email;
    String get Password => password;




}