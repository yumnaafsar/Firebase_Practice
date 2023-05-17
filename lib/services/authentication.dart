import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  FirebaseAuth _auth =FirebaseAuth.instance;

  Future createNewUser(String email, String password)async{
    try {
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email, password: password);

      User? user= userCredential.user;
      return user;

    } catch (e) {
      print(e.toString());
    }
  }

  Future logInUser(String email,String password) async
  {
    try {
      UserCredential userCredential= await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async
  {
    try {
      return _auth.signOut();
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

