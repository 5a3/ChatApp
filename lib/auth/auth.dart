import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar__app/auth/login.dart';
import 'package:scholar__app/home/homepage.dart';

class authpage extends StatelessWidget {
  const authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snap) {
          if (snap.hasData) {
            return chatpage();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
