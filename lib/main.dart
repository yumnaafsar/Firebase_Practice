import 'package:firebase_app/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app/registrationScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/services/authentication.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: 
    {
      '/login': (context)=>LoginScreen(),
      '/register':(context)=> RegistrationScreen(),
      '/dashboard':(context) => Dashboard(),
    },
  ));
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _key =GlobalKey<FormState>();
  TextEditingController  _emailController =TextEditingController();
  TextEditingController  _passwordController =TextEditingController();

  AuthenticationService _auth= AuthenticationService();
  void SignInUser() async
  {
    var result= await _auth.logInUser( _emailController.text, _passwordController.text);
    if(result == null)
    {
      print("Sign in error, please try again");
    }
    else
    {
      _emailController.clear();
      _passwordController.clear();
      print("Sign in successfull");
      Navigator.pushNamed(context, '/dashboard');
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
                Text('Login',style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,),
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
                          controller: _passwordController,
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
                        SizedBox(height: 5,),
                        FlatButton(
                          child: Text('Not registered? Sign up'),
                          onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context)=>RegistrationScreen(),)
                          );
                        }, 
                        textColor: Colors.white,
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                            child:Text('Login') ,
                            onPressed: (){
                              if(_key.currentState! .validate()){
                                SignInUser();
                              }
                            },
                            color: Colors.white,
                            )
                          ],
                        )
                    ],
                  ),
                  )
              ],
            ) 
          ),
        ),
      ),
    );
  }
}
