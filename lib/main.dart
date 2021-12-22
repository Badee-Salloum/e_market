import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/login.dart';
import 'package:e_market/pages/admin.dart';
import 'text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    ),
  );
}
