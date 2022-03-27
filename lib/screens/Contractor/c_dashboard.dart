import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spike_codeshastra/screens/Contractor/worker.dart';
import 'package:spike_codeshastra/screens/project_login.dart';

class cDashboard extends StatefulWidget {
  static const String id = 'cDashboard';

  const cDashboard({Key? key}) : super(key: key);

  @override
  State<cDashboard> createState() => cDashboardState();
}

class cDashboardState extends State<cDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contractors"),
          actions: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
                sharedPreferences.setInt('Login_status', 0);
                Fluttertoast.showToast(
                  msg: "Logged Out Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                );
                Navigator.pushNamed(context, ProjectLogin.id);
              },
              label: Text("Logout"),
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Container(
          decoration:const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jfif"),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 140,
              ),
              Center(
                child: Container(
                  height: 250,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Worker()),
                            );
                          },
                          child: Card(
                              elevation: 40,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                width: 160,
                                height: 160,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: const [
                                      Image(
                                        image: AssetImage('assets/images/list.png'),
                                        height: 100,
                                      ),
                                      Text(
                                        "List of Workers",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.pushNamed(context, WaterIrrigation.id);
                          },
                          child: Card(
                              elevation: 40,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                width: 160,
                                height: 160,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: const [
                                      Image(
                                        image: AssetImage('assets/images/safety.png'),
                                        height: 100,
                                      ),
                                      Text(
                                        "Safety",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
