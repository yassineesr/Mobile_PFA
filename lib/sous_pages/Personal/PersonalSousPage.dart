// ignore_for_file: deprecated_member_use



import 'package:flutter/material.dart';
import 'package:flutter_application_3/global_variables/global_variables.dart';
import 'package:flutter_application_3/pages/LoginPage.dart';
import 'package:flutter_application_3/pages/PersonalProfilePage.dart';
import 'package:image_picker/image_picker.dart';



class PersonalSousPage extends StatefulWidget {
  const PersonalSousPage({super.key});

  @override
  State<PersonalSousPage> createState() => _PersonalSousPageState();
}

class _PersonalSousPageState extends State<PersonalSousPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController nameController= TextEditingController();
  final TextEditingController lastNameController= TextEditingController();
  
  final image_picker=ImagePicker();

  String _qrCodeData = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change informations'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () { 
              Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalProfilePage()),
                );


           },
          icon: Icon(Icons.home),



        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
               
               TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your First name';
                  }
                  
                },
              ),

              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Last name';
                  }
                  
                },
              ),


              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  
                },
              ),

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                 
                },
              ),
              
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                                },
              ),

               

              ElevatedButton(
                onPressed: (){
                    showModalBottomSheet(context: context, builder:(((builder) => upload_choice())));



                },
                child: Text('upload'),
              ),

              ElevatedButton(
                onPressed: _changeGolbalvariable,
                child: Text('Valider'),
              ),

             
                
            ],
          ),
        ),
      ),
    );
  }




  void _changeGolbalvariable() {
   

      setState(() {
        
        email_global=_emailController.text;
        num_global=_phoneController.text;
        adr_global=_addressController.text;
        nom_global_pers=lastNameController.text;
        prenom_global_pers=nameController.text;
      });
      
      setState(() {
        _qrCodeData = "$nom_global_pers $prenom_global_pers $email_global $num_global $adr_global";
      });
    ScaffoldMessenger.of(context).showSnackBar(

                                const SnackBar(content: Text("Valide"))

                             );
     FocusScope.of(context).requestFocus(FocusNode());//clavier goes down
  }


  void uppload_image( ImageSource usersource) async {
    final pickedim= await image_picker.getImage(source: usersource);

    setState(() {
      if(pickedim!=null){
     image1=pickedim;
    }else{}

    });

  }

   Widget upload_choice() {
  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: <Widget>[
        Text(
          'choose method',
          style: TextStyle(
            fontSize: 20,
          ),
        ),

        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(onTap: () {

              uppload_image( ImageSource.camera);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20.0,
                child: Icon(Icons.camera_alt ,size: 40.0, color: Colors.white),
              ),
              SizedBox(height: 10.0), 
             
              Text('camera', style: TextStyle(fontSize: 18.0)),
            ],
          ),),

            SizedBox(width: 70),

          InkWell(onTap: () {

            uppload_image( ImageSource.gallery);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20.0,
                child: Icon(Icons.image ,size: 40.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Text('gallery', style: TextStyle(fontSize: 18.0)),
            ],
          ),),

       
            


          ],
        ),
      ],
    ),
  );
}
}