import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:spike_codeshastra/screens/project_login.dart';

final _firestore = FirebaseFirestore.instance;

class SignUp extends StatefulWidget {
  static const String id = 'signup';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  late String emailid;
  late String passwd;
  late String name;
  late String phone;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sign Up',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            // key: _scaffoldKey,
            appBar: AppBar(
              title: const Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            backgroundColor: const Color(0xFFffffff),
            body: Center(
              child: Container(
                height: 460,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  // key: formKey, //key for form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          name = value;
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
                          hintText: 'Enter your Name',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
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
                          hintText: 'Enter your Email',
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          phone = value;
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
                          hintText: 'Enter your phone number',
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
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
                          hintText: 'Enter your password',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.red[900],
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            onPressed: () async {
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: emailid, password: passwd);
                                _firestore.collection('users').doc(emailid).set({
                                  'name': name,
                                  'phone': phone,
                                  'role': 'owner'
                                });
                                // ignore: unnecessary_null_comparison
                                if (newUser != null) {
                                  Navigator.pushNamed(context, ProjectLogin.id);
                                }
                              } catch (e) {
                                // ignore: avoid_print
                                print(e);
                              }
                            },
                            minWidth: 200.0,
                            height: 42.0,
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}