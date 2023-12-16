import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'editpage.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  void delete(id) {
    students.doc(id).delete();
setState(() {

});
  }

  CollectionReference students =
      FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StudentApp"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: students.orderBy("name").snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final d = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: d.length,
                  itemBuilder: (context, index) {
                    final d1 = d[index];
                    return  Dismissible(

                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            delete(d1.id);
                            setState(() {

                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              content: Text(
                                "${d1["name"]} deleted",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.pinkAccent,
                              behavior: SnackBarBehavior.floating,
                            ));
                          }
                          if (direction == DismissDirection.startToEnd) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewPage(),
                                ));
                          }
                        },
                        background: Container(
                          color: Colors.red,
                        ),
                        key: UniqueKey(),
                        // key: Key("d1[index]"),
                        child: Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, "/edit", arguments: {
                                "name": d1["name"],
                                "grade": d1["grade"],
                                "roll": d1["roll"],
                                "id": d1.id
                              });
                            },
                            trailing: CircleAvatar(
                              radius: 35,
                              child: Center(
                                child: Text(
                                  d1["grade"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: Colors.pink),
                                ),
                              ),
                            ),
                            subtitle: Text(
                              "Roll number:${d1["roll"]}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                              d1["name"],
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.purpleAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ));
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
