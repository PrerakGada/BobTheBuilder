import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/add_contractor.dart';

class Contractor extends StatefulWidget {
  static const String id = 'projects';
  const Contractor({Key? key}) : super(key: key);

  @override
  State<Contractor> createState() => _ContractorState();
}

class _ContractorState extends State<Contractor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back,), onPressed: () { Navigator.pop(context); },),
          title: Text("Contractors"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: TextButton.icon(onPressed: () {
                DialogContractor.exit(context);
              }, icon: Icon(Icons.add_circle, size: 26,), label: Text("Add",
                style: TextStyle(
                    fontSize: 18
                ),
              ))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Existing Contractors",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 8.0, bottom: 8.0,),
                          child: Center(
                            child: Text("Shubh Zatakia",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
