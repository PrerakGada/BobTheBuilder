import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/p_dashboard.dart';

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
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings), title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts), title: Text("Contact Us"),
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
