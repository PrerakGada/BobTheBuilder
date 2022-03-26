import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;


class DialogHelper {
  static exit(context) => showDialog(
      context: context, builder: (context) => ExitConfirmationDialog());
}

class ExitConfirmationDialog extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  _ExitConfirmationDialogState createState() => _ExitConfirmationDialogState();
}

class _ExitConfirmationDialogState extends State<ExitConfirmationDialog> {
  late String p_name;
  late String lat;
  late String long;
  late String c_name;

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
      height: 420,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text("Project Details",
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
                  p_name = value;
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
              Text("Latitude and Longitude",
              style: TextStyle(
                fontWeight: FontWeight.w500
              ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        lat = value;
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
                        hintText: 'LAT',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        long = value;
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
                        hintText: 'LONG',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text("Contracter Assigned",
                style: TextStyle(
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                onChanged: (value) {
                  c_name = value;
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
                  hintText: 'Enter Contractor Name',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () async {

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
        )
      ));
}
