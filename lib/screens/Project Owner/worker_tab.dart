import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/attendance.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/details.dart';

class Tabs extends StatefulWidget {

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //leading: IconButton(icon: Icon(Icons.arrow_back,), onPressed: () { Navigator.pop(context); },),
          title: Text("Shubh Zatakia"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.account_box_outlined),
                text: "Attendance",
              ),
              Tab(
                icon: Icon(Icons.account_box_outlined),
                text: "Details",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Attendance(),
            Details(),
          ],
        ),
      ),
    );
  }
}