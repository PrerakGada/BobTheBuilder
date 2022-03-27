import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(230, 255, 255, 1)),
      home:Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 120,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: new Container(
                                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey,
                                    height: 40,
                                  ))),
                          Text("Wednesday, 27 March 2022",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                          Expanded(
                              child: new Container(
                                  margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                                  child: Divider(
                                    color: Colors.grey,
                                    height: 40,
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 20,),
                          Expanded(
                            child: Row(
                              children: [
                                Text("In Time :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text("9:00pm"),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Expanded(
                              child: Row(
                                children: [
                                  Text("Out Time :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  Text("9:00pm"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
