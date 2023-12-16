import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class DataListView extends StatefulWidget {
  const DataListView({super.key});

  @override
  State<DataListView> createState() => _DataListViewState();
}

class _DataListViewState extends State<DataListView> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:StreamBuilder<QuerySnapshot>(
          stream:FirebaseFirestore.instance.collection("animal").snapshots() ,
          builder: (context, snapshot) {
            final d=snapshot.data!.docs;
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: d.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(d[index]["name"]),
                        subtitle: Text("${d[index]["age"]}"),
                      ),
                    );
                  },);
            }
            else{
              return CircularProgressIndicator();
            }
          },

        ),
      ),
    );
  }
}
