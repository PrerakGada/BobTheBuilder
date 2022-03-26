import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back,), onPressed: () { Navigator.pop(context); },),
          title: Text("Projects"),
        ),
        body: Column(
          children: <Widget>[
            Text("Shubh")
          ],
        ),
      ),
    );
  }
}
