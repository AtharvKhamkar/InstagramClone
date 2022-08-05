import 'package:flutter/material.dart';
import 'package:instagrame_clone/responsive/mobile_screen_layout.dart';
import 'package:instagrame_clone/responsive/responsive_layout_screen.dart';
import 'package:instagrame_clone/responsive/web_screen_layout.dart';
import 'package:instagrame_clone/screens/login_screen.dart';
import 'package:instagrame_clone/screens/signup_screen_layout.dart';
import 'package:instagrame_clone/util/colours.dart';
import 'package:instagrame_clone/util/dimentions.dart';
import 'package:instagrame_clone/responsive/responsive_layout_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
//      home: const ResponsiveLayout(
        //       mobileScreenLayout: mobile_screen_layout(),
        //     webScreenLayout: web_screen_layout(),
        home: signup_screen_layout());
  }
}
