import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/worker_login.dart';

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
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bob the Builder'),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
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
                        Navigator.pushNamed(context,WorkerLogin.id);
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
                                    "Worker",
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
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                       /* Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ParentLoginPage()),
                        );*/
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
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StudentLoginPage(),
                        ));*/
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
          ),
        ),
      ),
    );
  }
}
