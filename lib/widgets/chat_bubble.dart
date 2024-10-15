import 'package:flutter/material.dart';
import 'package:scholar__app/constans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scholar__app/models/message.dart';

class chat_bubble extends StatelessWidget {
  chat_bubble({super.key, this.nameuser, required this.massage});
  String? nameuser;
  Message massage;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
          // width: double.infinity,

          decoration: BoxDecoration(
              color: primarycolor_const,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(17),
                  topRight: Radius.circular(17),
                  topLeft: Radius.circular(17))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              massage.message,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////

class chat_bubble_from_another extends StatelessWidget {
  chat_bubble_from_another({super.key, this.nameuser, required this.massage});
  String? nameuser;
  Message massage;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
          // width: double.infinity,

          decoration: BoxDecoration(
              color: Color.fromARGB(255, 173, 183, 214),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                  topLeft: Radius.circular(17))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(" ${nameuser}"),
                Text(
                  massage.message,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
