// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spike_codeshastra/Services/service.dart';

class Projects extends StatefulWidget {
  static const String id = 'projects';
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  DataService ?d1;
  String ?text;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back,), onPressed: () { Navigator.pop(context); },),
          title: Text("Projects"),
        ),
        body: StreamBuilder<QuerySnapshot>
        (
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot)
          {
            if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
            
          }
          else
          {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 10,
                  child: Text(snapshot.data?.docs[index]['role']),
                );
              },
            );
          }
          }
        )
      ),
    );
  }
}