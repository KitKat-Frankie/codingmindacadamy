import 'package:cmaminiproject/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cmaminiproject/homepage.dart';
import 'loginpage.dart';

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
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/":(context) =>const LoginPage(),
        "/Login":(context) => const LoginPage(),
        "/Home":(context) =>const HomePage(),

      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

    );
  }
}

