import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_market/pages/home.dart';
import 'register.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool logIn = false;
  // void isLogIn() {
  //   if (logIn) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => HomePage(''),
  //       ),
  //     );
  //   }
  // }

  late String email;
  final _auth = FirebaseAuth.instance;
  late String password;
  bool showSpinner = false;
  @override
  void initState() {
    super.initState();
    // isLogIn();
  }

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
                      final loginUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      print('${_auth.currentUser!.uid}');
                      if (loginUser.user!.uid.isEmpty) {
                        setState(() {
                          email = '';
                          password = '';
                          showSpinner = true;
                        });
                        Fluttertoast.showToast(
                            msg: 'Username and password\nare not correct');
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              locUsername: loginUser.user!.email.toString(),
                            ),
                          ),
                        );
                      }
                      print('2');

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
                    'Log In',
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
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign up Page',
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
                SizedBox(
                  height: 48.0,
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
                        cursorColor: Colors.red,
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
                          icon: Icon(
                            Icons.email,
                            color: Colors.red,
                          ),
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
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
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
                          icon: Icon(
                            Icons.lock,
                            color: Colors.red,
                          ),
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
