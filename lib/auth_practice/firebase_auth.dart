
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'authfunctions.dart';


class FireAuth extends StatefulWidget {
  const FireAuth({super.key});

  @override
  State<FireAuth> createState() => _FireAuthState();
}

class _FireAuthState extends State<FireAuth> {
  bool a=false;
  final _ke=GlobalKey<FormState>();

  String name='';
  //String email='';
  String pass='';
 TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("desiApp"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Colors.red,
        elevation: 10,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _ke,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
a? Container():

TextFormField(
  validator: (value) {
    if(value.toString().isEmpty){
      return "field cannot be empty";
    }
    if(value.toString().length <=2){
      return "must contain 3 characters";
    }
  },
  onSaved: (newValue) {
    name=newValue!;
  },
  key: ValueKey('name'),
  decoration: InputDecoration(
    border: OutlineInputBorder(),
      hintText: "enter ur name"),
),
              SizedBox(height: 6,),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "email",
                    hintText: "enter ur email"),
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (value) {
                  if(value.toString().isEmpty){
                    return "field cannot be empty";
                  }
                  if(value.toString().length <=5){
                    return "enter strong password";
                  }
                },
                onSaved: (newValue) {
                  pass=newValue!;
                },
                obscureText: true,
                key: ValueKey("pass"),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "enter ur passsword"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (){
                    if(_ke.currentState!.validate()){
                     _ke.currentState!.save();
                     a? signin(email.text,pass) :sigup(email.text, pass);
                    }
                  },
                  child: a? Text("signIN"):Text("signUP"))


              ,
              SizedBox(
                height: 8,
              ),
              TextButton(
                  onPressed: (){
                   setState(() {
                     a=true;
                   });
                  },
                  child:a?  Text("dont have an Account>") : Text("already have an Account>"))
            ],
          ),
        ),
      ),
    );
  }
}
