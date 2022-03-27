// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:spike_codeshastra/screens/signup.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/p_dashboard.dart';
import 'package:spike_codeshastra/screens/Contractor/c_dashboard.dart';

import '../Services/service.dart';
//import 'package:spike_codeshastra/screens/splash_screen.dart';


class ProjectLogin extends StatefulWidget {
  static const String id = 'worker_login';

  const ProjectLogin({Key? key}) : super(key: key);

  @override
  State<ProjectLogin> createState() => _ProjectLoginState();
}

class _ProjectLoginState extends State<ProjectLogin> {
  final _auth = FirebaseAuth.instance;
  late String emailid;
  late String passwd;
  late String role;
  final DataService d1=DataService();
  late DocumentSnapshot doc;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          // key: _scaffoldKey,
            appBar: AppBar(
              title: const Text('Login'),
            ),
            backgroundColor: const Color(0xFFffffff),
            body: Center(
              child: Container(
                height: 350,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  // key: formKey, //key for form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Log In",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        // controller: email,
                        onChanged: (value) {
                          emailid = value;
                        },
                        // enableInteractiveSelection: false,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintText: 'Enter you Email',
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        // controller: password,
                        onChanged: (value) {
                          passwd = value;
                        },
                        obscureText: true,
                        // enableInteractiveSelection: false,
                        decoration:
                        //InputDecoration(labelText: "Enter your Number"),
                        const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintText: 'Enter you password',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.red[900],
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            // onPressed: () {
                            //   //Navigator.pushNamed(context, Loading.id);
                            //   print("Hello");
                            // },
                            onPressed: () async {
                              try {
                                print(emailid);
                                print(passwd);

                                final user =
                                await _auth.signInWithEmailAndPassword(
                                    email: emailid, password: passwd);

                                // ignore: unnecessary_null_comparison
                                if (user != null) {
                                  doc=await d1.read(emailid);
                                  // final SharedPreferences sharedPreferences =
                                  //     await SharedPreferences.getInstance();
                                  // sharedPreferences.setInt('Login_status', 1);
                                  print(emailid);
                                  print(passwd);
                                  role=doc.get('role');
                                  if(role=='owner')
                                  {
                                    final SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                    sharedPreferences.setInt('Login_status', 2);
                                    Navigator.pushReplacementNamed(context, pDashboard.id);
                                  }
                                  else if(role=='contractor')
                                  {
                                    final SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                    sharedPreferences.setInt('Login_status', 1);
                                    Navigator.pushReplacementNamed(context, cDashboard.id);
                                  }


                                  //
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            minWidth: 200.0,
                            height: 42.0,
                            child: const Text(
                              'Log In',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 70,),
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Text("New Project Owner?")),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context,SignUp.id);
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}