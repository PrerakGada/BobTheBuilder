import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/add_project.dart';

final _firestore = FirebaseFirestore.instance;

class Projects extends StatefulWidget {
  static const String id = 'projects';

  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
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
          title: Text("Projects"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: TextButton.icon(
                        onPressed: () {
                          DialogHelper.exit(context);
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
                    "On Going Projects",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('projects').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                        );
                      }
                      final projects = snapshot.data!.docs;
                      List<ProjectCard> projectsCards = [];
                      for (var project in projects) {
                        final name = project.get('name');
                        final c_name = project.get('contractor');

                        final projectCard = ProjectCard(
                          c_name: c_name, name: name,);

                        projectsCards.add(projectCard);
                      }
                      return SizedBox(
                        height: 600,
                        child: ListView(
                          children: projectsCards,
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key, required this.name, required this.c_name,
  }) : super(key: key);

  final String name;
  final String c_name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        color: Colors.white,
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          " Contractor : ",
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          c_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       Text(
                  //         " Location : ",
                  //         style: TextStyle(fontSize: 14),
                  //       ),
                  //       Text(
                  //         "Malad East",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 14),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
