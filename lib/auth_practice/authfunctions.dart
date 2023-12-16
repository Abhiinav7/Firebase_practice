
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

sigup(String email,String password)async {
  try {
    final c = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password);
    print("///////////////////Succes///////////");
  }
  on FirebaseAuthException catch (e) {
print("///////////////////////${e}/////////////////////////////");

    if (e.code == 'weak-password') {
      print('-----------The password provided is too weak------------.');
    }
    else if(e.code=="invalid-email"){
      print('----------enter valid email.------------');

       return Fluttertoast.showToast(

          msg: "enter a valid email ",
          toastLength: Toast.LENGTH_SHORT, // Toast duration (SHORT or LONG)
          gravity: ToastGravity.BOTTOM, // Toast gravity (TOP, CENTER, or BOTTOM)
          timeInSecForIosWeb: 1, // Duration for iOS and web
          backgroundColor: Colors.grey, // Background color
          textColor: Colors.white, // Text color
          fontSize: 20.0, // Text font size
        );

    }
    else if(e.code=="channel-error"){
      print('---------field is empty.------------');
    }
    else if (e.code == 'email-already-in-use') {
      print('----------The account already exists for that email.------------');
    }
  }
}
signin(String email,String password)async{
  try{
    final r=await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password);
    User? user=r.user;
    if(user != null){
      print("/////////////////Login succes//////////////");
    }
  }
 on FirebaseAuthException catch(e){
    print("erroorr=============${e.code}");
    if (e.code == 'user-not-found') {
      print('/////////////////No user found for that email.///////////////');
    } else if (e.code == 'wrong-password') {
      print('/////////////////Wrong password provided for that user.////////////////');
    }
 }
}