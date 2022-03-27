import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/add_project.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/add_supervisor.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/delete_supervisor.dart';

final _firestore = FirebaseFirestore.instance;

class SuperVisor extends StatefulWidget {
  static const String id = 'projects';

  const SuperVisor({Key? key}) : super(key: key);

  @override
  State<SuperVisor> createState() => _SuperVisorState();
}

class _SuperVisorState extends State<SuperVisor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(230, 255, 255, 1)),
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
          title: Text("Supervisor"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                            onPressed: () {
                              DialogSupervisor.exit(context);
                            },
                            icon: Icon(
                              Icons.add_circle,
                              size: 26,
                            ),
                            label: Text(
                              "Add",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                      Expanded(
                        child: TextButton.icon(
                            onPressed: () {
                              DialogSupervisorSub.exit(context);
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 26,
                              color: Colors.red[900],
                            ),
                            label: Text(
                              "Delete",
                              style: TextStyle(fontSize: 18,
                                  color: Colors.red[900]
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Existing Supervisor",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('users').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                      );
                    }
                    final contractors = snapshot.data!.docs;
                    List<SupervisorCard> contractorCards = [];
                    for (var contractor in contractors) {
                      final role = contractor.get('role');
                      if (role == "supervisor") {
                        final name = contractor.get('name');

                        final contractorCard = SupervisorCard(
                          name: name,
                        );

                        contractorCards.add(contractorCard);
                      }
                    }

                    return SizedBox(
                      height: 600,
                      child: ListView(
                        children: contractorCards,
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SupervisorCard extends StatelessWidget {
  const SupervisorCard({
    Key? key, required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: 8.0,
            bottom: 8.0,
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
