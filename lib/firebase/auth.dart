import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/views/homeview/homeScreen.dart';
import 'package:login_app/views/loginview/loginScreen.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  void register(String email, password) {
    auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  void login(String email, password, BuildContext context) {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Login Successfully"))),
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()))
            });
  }

  void logout(BuildContext context) {
    auth.signOut().then((value) => {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Logout Suceess"))),
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()))
        });
  }

  void forgetpassword(String myemail, BuildContext context) {
    auth.sendPasswordResetEmail(email: myemail).then((value) => {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Email Sent")))
        });
  }
}
