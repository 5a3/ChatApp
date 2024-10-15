import 'package:flutter/material.dart';

const primarycolor_const = Color(0xff2B475D);
const massagescollaction = 'massages';
const kmessage = 'text';

class Logo extends StatelessWidget {
  Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/scholar.png',
      fit: BoxFit.fill,
    );
  }
}

  // # firebase_auth: ^0.18.4+1


  // # firebase_core: ^0.5.3

