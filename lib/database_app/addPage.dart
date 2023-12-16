import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddStudents extends StatefulWidget {
  const AddStudents({super.key});

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  int i=0;

  CollectionReference students=FirebaseFirestore.instance.collection("students");

  TextEditingController name = TextEditingController();
  TextEditingController roll = TextEditingController();
  TextEditingController grade = TextEditingController();

  add()async{
 try{
   final data={
     "name":name.text,
     "roll":roll.text,
     "grade":grade.text
   };

students.add(data);
   print("//////////////added Succesfully////////");
 }
 catch(e){
   print("/////////////////error=====${e}");
 }


}
  @override
  Widget build(BuildContext context) {

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
                        add();
                        Fluttertoast.showToast(

                          msg: "Student details added succesfully",
                          toastLength: Toast.LENGTH_SHORT, // Toast duration (SHORT or LONG)
                          gravity: ToastGravity.BOTTOM, // Toast gravity (TOP, CENTER, or BOTTOM)
                          timeInSecForIosWeb: 1, // Duration for iOS and web
                          backgroundColor: Colors.grey, // Background color
                          textColor: Colors.white, // Text color
                          fontSize: 20.0, // Text font size
                        );
                        Navigator.pop(context);
                      }, child: Text("Add student",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
