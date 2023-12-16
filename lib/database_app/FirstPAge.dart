import 'package:firebase_study/database_app/addPage.dart';
import 'package:firebase_study/database_app/viewPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("StudentApp"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25))
       ),
        centerTitle: true,
        //backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 60,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPage(),));
                  },
                      child: Text("view students", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600), ))),
              SizedBox(height: 20,),
              Container(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {


                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudents(),));

                  },
                      child: Text("add students", style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),)))
            ],
          ),
        ),
      ),
    );
  }
}
