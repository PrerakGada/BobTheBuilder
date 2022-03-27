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
                          ReadMoreText(
                            '''Head: Not Protected
          Confidence:50
        Right Hand: Protected
        Left Hand: Protected
        Face: Not Protected''',
                            style: TextStyle(color: Colors.black,fontSize: 15),
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                  ),
                  Container(height:30),
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
                          ReadMoreText(
                            '''Person:1
        Head: Protected
        Confidence:50
        Right Hand: Protected
        Left Hand: Protected
        Face: Protected
                          
         Person:2
         Head: Protected
              Confidence:99
         Right Hand: Protected
         Left Hand: Protected
         Face: Protected 
         Person:3
         Head: Protected
           Confidence:99
         Right Hand: Protected
         Left Hand: Protected
         Face: Protected''',
                            
                            style: TextStyle(color: Colors.black,fontSize: 15),
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                  ),
                  Container(height: 20,),
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
                          ReadMoreText(
                            '''Head: Not Protected
                Confidence:50
        Right Hand: Not Protected
        Left Hand: Not Protected
        Face: Not Protected''',
                            style: TextStyle(color: Colors.black,fontSize: 15),
                            trimLines:1,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold,color: Colors.amber),
                          )
                        ],
                      ),
                    ),
                  )
                  ),
                  
            ],
          ),
        ),
      ),
    );
  }
}
