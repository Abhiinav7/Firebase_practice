import 'package:flutter/material.dart';

class MyStorage extends StatefulWidget {
  const MyStorage({super.key});

  @override
  State<MyStorage> createState() => _MyStorageState();
}

class _MyStorageState extends State<MyStorage> {
  String? gender;

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                        borderRadius: BorderRadius.circular(12)),

                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 5),
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "enter name",
                    labelText: "Name",
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red, width: 5),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "enter age",
                    labelText: "Age",
                  ),
                ),
                RadioListTile(
                  title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Female"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),

                Container(
                    width: double.infinity,
                    height: 45,
                    child:
                        ElevatedButton(onPressed: () {

                        }, child: Text("SignUP"))),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
