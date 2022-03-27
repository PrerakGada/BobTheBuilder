// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Safetyscreen extends StatefulWidget {
  static const String id = 'safteyscreen';

  const Safetyscreen({Key? key}) : super(key: key);

  @override
  State<Safetyscreen> createState() => _SafetyscreenState();
}

class _SafetyscreenState extends State<Safetyscreen> {
  static const String id = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back,), onPressed: () { Navigator.pop(context); },),
          title: Text("SafetyScreen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                  elevation: 20,
                  color: Color.fromRGBO(204, 238, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: 260,
                    height: 260,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/ppe3.jpg'),
                            height: 100,
                          ),
                          Container(height: 20),
                          Text(
                            "Number of person:1",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 10,
                          ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Text("Head: Protected"),
                             Text("Confidence:50"),
                             Text("Right Hand: Protected"),
                             Text("Left Hand: Protected"),
                             Text("Face: Not Protected"),
                           ],
                         ),
                        ],
                      ),
                    ),
                  )),
              Container(height: 30),
              Card(
                  elevation: 20,
                  color: Color.fromRGBO(204, 238, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: 260,
                    height: 480,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/ppe6.jpg'),
                            height: 100,
                          ),
                          Container(height: 20),
                          Text(
                            "Number of person:3",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Person:1"),
                              Text("Head: Protected"),
                              Text("Confidence:50"),
                              Text("Right Hand: Protected"),
                              Text("Left Hand: Protected"),
                              Text("Face: Protected"),
                              Text("Person:2"),
                              Text("Head: Protected"),
                              Text("Confidence:99"),
                              Text("Right Hand: Protected"),
                              Text("Left Hand: Protected"),
                              Text("Face: Protected"),
                              Text("Person:3"),
                              Text("Head: Protected"),
                              Text("Confidence:99"),
                              Text("Right Hand: Protected"),
                              Text("Left Hand: Protected"),
                              Text("Face: Protected''',"),



                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              Container(
                height: 20,
              ),
              Card(
                  elevation: 20,
                  color: Color.fromRGBO(204, 238, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: 260,
                    height: 260,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/ppe5.jpg'),
                            height: 100,
                          ),
                          Container(height: 20),
                          Text(
                            "Number of person:1",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 10,
                          ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Text("Head: Not Protected"),
                             Text("Confidence:50"),
                             Text("Right Hand: Not Protected"),
                             Text("Left Hand: Not Protected"),
                             Text("Face: Not Protected''',"),
                           ],
                         ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
