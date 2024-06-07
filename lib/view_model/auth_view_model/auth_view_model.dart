


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/utils/utils.dart';
import 'package:plant_shop/view/auth_view/sign_in_view/sign_in_view.dart';
import 'package:plant_shop/view/bottom_navigator_view/bottom_navigator_view.dart';

class AuthViewModel {

  final _auth = FirebaseAuth.instance;
  final Utils utils = Utils();

  Future<void> saveUserData(String userName , email) async {
    try{
      await FirebaseFirestore.instance.collection('users').add({
        "userName" : userName,
        "email": email,
        "createDate" : DateTime.now(),
      });
    }catch(error){

    }
  }

  /// sign up method
  Future<void> registerUser(BuildContext context , userName, String email , password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        saveUserData(userName, email);
        Utils().toastMessage("User Resister Successfully");
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigatorView()));
      });
    }on FirebaseAuthException catch(error) {
      Utils().toastMessage(error.code.toString());
    }
  }


  /// sign in method
  Future<void> signIn(BuildContext context, String email , password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        Utils().toastMessage("Sign in successfully");
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigatorView()));
      });
    }on FirebaseAuthException catch(error){
      Utils().toastMessage(error.code);
    }
  }


  /// sign out method
  void signOut(BuildContext context) async {
    try{
      await _auth.signOut().then((value) {
        Utils().toastMessage("User sign out successfully");
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInView()));
      });
    }on FirebaseAuthException catch(error){
      Utils().toastMessage(error.code);
    }
  }

}