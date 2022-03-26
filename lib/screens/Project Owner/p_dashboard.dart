import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/contractor.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/projects.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/supervisor.dart';

class pDashboard extends StatefulWidget {
  static const String id = 'Dashboard';
  const pDashboard({Key? key}) : super(key: key);

  @override
  State<pDashboard> createState() => _pDashboardState();
}

class _pDashboardState extends State<pDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Owner',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project Owner")),
      body: Center(child: Text(
        'A drawer is an invisible side screen.',
        style: TextStyle(fontSize: 20.0),
      )
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Shubh Zatakia"),
              accountEmail: Text("shubhzatakia111@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "S",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Image(
                image: AssetImage(
                  'assets/images/Logo.jpeg',
                ),
              ), title: Text("Projects"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Projects()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings), title: Text("Contractor"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Contractor()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts), title: Text("Supervisor"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SuperVisor()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts), title: Text("Task"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout), title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
