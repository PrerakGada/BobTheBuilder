import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/add_project.dart';

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
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                " Kanakia Levels",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          " Contractor : ",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          "Jenil Shah",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          " Location : ",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          "Malad East",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
