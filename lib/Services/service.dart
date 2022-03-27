// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataService
{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void init() async
  {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  Future<DocumentSnapshot> read(String email) async
  {
    DocumentSnapshot doc;
    // ignore: prefer_typing_uninitialized_variables
    init();
    doc=await firestore.collection('users').doc(email).get();
    return doc;
  }

void deletework(String name) async
{
  try
      {
        firestore.collection('workers').doc(name).delete();
      }
      catch(e)
  {
    print(e);
  }
}

  void deletecontract(String email) async
  {
    try
    {
      firestore.collection('users').doc(email).delete();
    }
    catch(e)
    {
      print(e);
    }
  }

  void deleteproj(String pname) async
  {
    try
    {
      firestore.collection('projects').doc(pname).delete();
    }
    catch(e)
    {
      print(e);
    }
  }


}

/* void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  //const MyApp({ Key? key }) : super(key: key);
   static const String id = 'Service_screen';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // ignore: unused_element
  void _create(String email,String name,String role,int phone) async {
  try {
    await firestore.collection('users').doc(email).set({
      'name':name,
      'phone':phone,
      'role': role
    });
  } catch (e) {
    print(e);
  }
}

void _update(String email,String upvalue,String upfield) async {
  try {
    firestore.collection('users').doc(email).update({
     upfield : upvalue,
    });
  } catch (e) {
    print(e);
  }
}

void _read(String email) async {
  DocumentSnapshot documentSnapshot;
  try {
    documentSnapshot = await   firestore.collection('users').doc(email).get();
    print(documentSnapshot.get('role'));
  } catch (e) {
    print(e);
  }
}

void _delete(String email) async {
  try {
    firestore.collection('users').doc(email).delete();
  } catch (e) {
    print(e);
  }
}
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Flutter CRUD with Firebase"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          /*RaisedButton(
            child: Text("Create"),
            onPressed: (){_create('kunalshah0492@gmail.com','kunal','owner',9322012176);} ,
          ),*/
          RaisedButton(
            child: Text("Read"),
            onPressed: (){_read("prerak.prem@gmail.com");},
          ),
          /*RaisedButton(
            child: Text("Update"),
            onPressed: _update,
          ),
          RaisedButton(
            child: Text("Delete"),
            onPressed: _delete,
          ),*/
        ]),
      ),
    );
  }
}*/

