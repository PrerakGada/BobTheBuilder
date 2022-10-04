import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;
late final String name;

class Attendance extends StatefulWidget {
  Attendance(String n){
    name = n;
  }



  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  late String date;
  late String IN;
  late String out;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(230, 255, 255, 1)),
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('workers').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                );
              }
              final contractors = snapshot.data!.docs;
              List<AttendanceCard> contractorCards = [];
              for (var contractor in contractors) {
                final name = contractor.get('name');

                final contractorCard = AttendanceCard();

                contractorCards.add(contractorCard);
                contractorCards.add(contractorCard);
                contractorCards.add(contractorCard);
                contractorCards.add(contractorCard);
              }
              return SizedBox(
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: <Widget>[
                      AttendanceCard(),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                Text(
                  "Wednesday, 27 March 2022",
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
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "In Time :",
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                        Text(
                          "Out Time :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("9:00pm"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
