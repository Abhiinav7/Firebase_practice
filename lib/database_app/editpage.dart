import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {


  CollectionReference students=FirebaseFirestore.instance.collection("students");

  TextEditingController name = TextEditingController();
  TextEditingController roll = TextEditingController();
  TextEditingController grade = TextEditingController();

  update(id)async{
    try{
      final data={
        "name":name.text,
        "roll":roll.text,
        "grade":grade.text
      };

      students.doc(id).update(data).then((value) => Navigator.pop(context));
      print("//////////////updated Succesfully////////");
    }
    catch(e){
      print("/////////////////error=====${e}");
    }


  }
  @override
  Widget build(BuildContext context) {
    final ard=ModalRoute.of(context)!.settings.arguments as Map;
    name.text=ard["name"];
    roll.text=ard["roll"];
   grade.text=ard["grade"];
   final id=ard["id"];

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: "enter name of students",
                          // labelText: "name"
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 5,color: Colors.red)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                              BorderSide(color: Colors.pink, width: 5)),
                          labelText: "Name")),
                  SizedBox(height: 12,),
                  TextField(
                      controller: roll,
                      decoration: InputDecoration(
                          hintText: "enter Roll number of students",
                          // labelText: "name"
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 5,color: Colors.red)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                              BorderSide(color: Colors.pink, width: 5)),
                          labelText: "Roll Num")),
                  SizedBox(height: 12,),
                  TextField(
                      controller: grade,
                      decoration: InputDecoration(
                          hintText: "enter grade of students",
                          // labelText: "name"
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 5,color: Colors.red)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                              BorderSide(color: Colors.pink, width: 5)),
                          labelText: "Grade")),
                  SizedBox(height: 12,),
                  Container(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        update(id);
                        Fluttertoast.showToast(

                          msg: "Student details edited succesfully",
                          toastLength: Toast.LENGTH_SHORT, // Toast duration (SHORT or LONG)
                          gravity: ToastGravity.BOTTOM, // Toast gravity (TOP, CENTER, or BOTTOM)
                          timeInSecForIosWeb: 1, // Duration for iOS and web
                          backgroundColor: Colors.grey, // Background color
                          textColor: Colors.white, // Text color
                          fontSize: 20.0, // Text font size
                        );
                        Navigator.pop(context);
                      }, child: Text("Edit student",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
