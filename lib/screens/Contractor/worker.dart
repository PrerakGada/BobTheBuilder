import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/Contractor/add_workers.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/add_contractor.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/worker_tab.dart';

final _firestore = FirebaseFirestore.instance;

class Worker extends StatefulWidget {
  static const String id = 'projects';

  const Worker({Key? key}) : super(key: key);

  @override
  State<Worker> createState() => _WorkerState();
}

class _WorkerState extends State<Worker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Workers"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: TextButton.icon(
                      onPressed: () {
                        DialogWorker.exit(context);
                      },
                      icon: Icon(
                        Icons.add_circle,
                        size: 26,
                      ),
                      label: Text(
                        "Add",
                        style: TextStyle(fontSize: 18),
                      ))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Existing Workers",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
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
                    List<WorkerCard> contractorCards = [];
                    for (var contractor in contractors) {
                      final name = contractor.get('name');

                      final contractorCard = WorkerCard(
                        name: name,
                      );

                      contractorCards.add(contractorCard);
                    }
                    return SizedBox(
                      height: 600,
                      child: ListView(
                        children: contractorCards,
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkerCard extends StatelessWidget {
  const WorkerCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        elevation: 10,
        child: ListTile(
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Tabs()),
              );
            },
            icon: Icon(Icons.arrow_forward_ios_sharp),
          ),
        ),
      ),
    );
  }
}
