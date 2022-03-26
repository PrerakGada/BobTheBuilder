import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/contractor_login.dart';
import 'package:spike_codeshastra/screens/project_login.dart';

class SelectLogin extends StatefulWidget {
  static const String id = 'select_login';
  const SelectLogin({Key? key}) : super(key: key);

  @override
  State<SelectLogin> createState() => _SelectLoginState();
}

class _SelectLoginState extends State<SelectLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bob the Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bob the Builder'),
        ),
        body: Center(
          child: Container(
            height: 260,
            width: 260,
            child: Column(
              children: <Widget>[
                const Text("Select Login",
                    style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ContractorLogin.id);
                      },
                      child: Card(
                          elevation: 10,
                          child: SizedBox(
                            width: 110,
                            height: 110,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        "https://www.teachusedumation.com/images/youtubelogo.png"), //NetworkImage
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ), //SizedBox
                                  Text(
                                    "Contractor",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ], //CirclAvatar
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ProjectLogin.id);
                      },
                      child: Card(
                          elevation: 10,
                          child: SizedBox(
                            width: 110,
                            height: 110,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        "https://www.teachusedumation.com/images/youtubelogo.png"), //NetworkImage
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ), //SizedBox
                                  Text(
                                    "Project Owner",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ], //CirclAvatar
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
