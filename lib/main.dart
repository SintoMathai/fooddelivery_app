import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fooddelivery_app/Add%20to%20cart.dart';
import 'package:fooddelivery_app/Payment.dart';
import 'package:fooddelivery_app/bottomnavigationbar.dart';
import 'package:fooddelivery_app/intropage.dart';
import 'package:fooddelivery_app/loginpage.dart';
import 'package:fooddelivery_app/mainscreen.dart';
import 'package:fooddelivery_app/provider.dart';
import 'package:fooddelivery_app/signup.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Addressprovider()),
      ChangeNotifierProvider(create: (context) => favour(),),
      ChangeNotifierProvider(create: (context) => filter(),)],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: bottombar()),
    ),
  );
}
