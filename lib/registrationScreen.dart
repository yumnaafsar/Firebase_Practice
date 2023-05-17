import 'package:firebase_app/services/authentication.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _key =GlobalKey<FormState>();
  TextEditingController  _nameController =TextEditingController();
  TextEditingController  _emailController =TextEditingController();
  TextEditingController  _passowrdController =TextEditingController();

  final AuthenticationService _auth= AuthenticationService();

  
  void createUser() async{
    var result= await _auth.createNewUser( _emailController.text, _passowrdController.text);
    if(result != null)
    {
      _emailController.clear();
      _passowrdController.clear();
      _nameController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: Form(
            key: _key,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Registration',style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      TextFormField(
                          controller: _nameController,
                          validator: (value){
                            if (value! .isEmpty){
                              return "Name cannot be empty";
                            }else
                               return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.white)),
                            style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                          controller: _emailController,
                          validator: (value){
                            if (value! .isEmpty){
                              return "Email cannot be empty";
                            }else
                               return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white)),
                            style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: _passowrdController ,
                          obscureText: true,
                          validator: (value){
                            if (value! .isEmpty){
                              return "Password cannot be empty";
                            }else
                               return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white)),
                            style: TextStyle(color: Colors.white),
                          ),
                        SizedBox(height: 30,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                            child:Text('Sign Up') ,
                            onPressed: (){
                              if(_key.currentState! .validate()){
                                createUser();
                              }
                            },
                            color: Colors.white,
                            ),
                            FlatButton(
                               child: Text('Cancel'),
                            onPressed: (){
                              Navigator.pop(context); },
                              color: Colors.white,
                              )
                          ],
                        )
                    ],
                  ),
                )
              ],
            ) ),
        ),
      ),
    );
  }
}