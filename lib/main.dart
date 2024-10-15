import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar__app/home/homepage.dart';
import 'auth/login.dart';
import 'auth/signup.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          Login.id: (context) => Login(),
          Signup.id: (context) => Signup(),
          chatpage.id: (context) => chatpage(),
          // 'AddNotes': (context) => AddNotes(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xff2B475D),
          textTheme:
              TextTheme(bodyLarge: TextStyle(fontSize: 13, color: Colors.blue)),
          primarySwatch: Colors.blue,
        ),
        home: authpage());
  }
}
