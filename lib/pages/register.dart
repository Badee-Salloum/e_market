import 'package:e_market/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'home.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _fireStore = FirebaseFirestore.instance;

// ignore: must_be_immutable
class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String email;
  late String name;
  String groupValue = 'male';
  bool showSpinner = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  late String confirmPassword;
  final _auth = FirebaseAuth.instance;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        'images/back1.jpg',
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      Container(
        color: Colors.red.withOpacity(0.1),
      ),
      Scaffold(
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FlatButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        showSpinner = true;
                      });
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      final uid = _auth.currentUser!.uid;
                      _fireStore.collection('users').doc(uid).set({
                        'name': name,
                        'email': email,
                        'gender': groupValue,
                        'time': FieldValue.serverTimestamp(),
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            locUsername: email,
                          ),
                        ),
                      );

                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                      setState(() {
                        email = '';
                        password = '';
                        showSpinner = false;
                      });
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red.shade900,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text(
                    'log in Page',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red.shade900,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          name = value;
                        },
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'Enter Your Full Name.',
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Gender :'),
                          Row(
                            children: <Widget>[
                              Text('Male'),
                              Radio(
                                  activeColor: Colors.red.shade900,
                                  value: 'male',
                                  toggleable: groupValue == 'male',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue =
                                          value == 'male' ? 'male' : 'female';
                                    });
                                  }),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Female'),
                              Radio(
                                  activeColor: Colors.red.shade900,
                                  toggleable: groupValue == 'female',
                                  value: 'female',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue =
                                          value == 'male' ? 'male' : 'female';
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'Enter Your Email.',
                          icon: Icon(Icons.email),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                        },
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'Enter Your Password.',
                          icon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'Confirm Your Password.',
                          icon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
