import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;


class DialogWorker {
  static exit(context) => showDialog(
      context: context, builder: (context) => ExitConfirmationDialog());
}

class ExitConfirmationDialog extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  _ExitConfirmationDialogState createState() => _ExitConfirmationDialogState();
}

class _ExitConfirmationDialogState extends State<ExitConfirmationDialog> {

  // final _auth = FirebaseAuth.instance;

  late String name;
  late String aadhar;
  late String wages;
  // late String contractor_assigned;
  late String project_assigned;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      //backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
      width: 350,
      height: 533,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),  
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text("Worker Details",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Name",
                    style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    // enableInteractiveSelection: false,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintText: 'Enter your Name',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("AADHAR",
                    style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    maxLength: 12,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      aadhar = value;
                    },
                    // enableInteractiveSelection: false,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintText: 'Enter your phone number',
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Payroal",
                    style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      wages = value;
                    },
                    // enableInteractiveSelection: false,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintText: 'Enter the Payroal',
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Project Assigned",
                    style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    onChanged: (value) {
                      project_assigned = value;
                    },
                    // enableInteractiveSelection: false,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintText: 'Enter Project Assigned',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: ElevatedButton(
                          child: Text('Submit'),
                          onPressed: () async {
                            try {
                              _firestore.collection('workers').doc(name).set({
                                'name': name,
                                'aadhar': aadhar,
                                'pay': wages,
                                'project': project_assigned,
                              });

                              Navigator.pop(context);
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            // background color
                              primary: Colors.red[900],
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ))),
                    ),
                  ),
                ],
              ),
            ),
          )
      ));
}
