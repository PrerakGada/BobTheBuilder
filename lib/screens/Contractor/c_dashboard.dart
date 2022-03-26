import 'package:flutter/material.dart';

class pDashboard extends StatefulWidget {
  const pDashboard({Key? key}) : super(key: key);

  @override
  State<pDashboard> createState() => _pDashboardState();
}

class _pDashboardState extends State<pDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contractors"),
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
