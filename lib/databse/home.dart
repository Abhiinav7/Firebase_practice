import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'databaseData.dart';
class MyHome extends StatefulWidget {
  const  MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  create()async{
    try{
      await FirebaseFirestore.instance.collection("animal").doc("deer").set({"name":"amum","age":2});
      print("////////////succes/////////////");
    }
    catch(e){
      print("/////////////////////////error=${e}////////////////////////");
    }

  }
  update()async{
    await FirebaseFirestore.instance.collection("animal").doc("dog").update(
        {"age":19});
    print("/////////////updated////");
  }
  delete()async{
    await FirebaseFirestore.instance.collection("animal").doc("cat").delete();
    print("document deleted//////////////////");
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){create();}, child: Text("create")),
            ElevatedButton(onPressed: (){update();}, child: Text("update")),
            ElevatedButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context) => DataListView(),));





            }, child: Text("retrive")),
            ElevatedButton(onPressed: (){delete();}, child: Text("delete"))
          ],
        ),
      ),


    );
  }
}
