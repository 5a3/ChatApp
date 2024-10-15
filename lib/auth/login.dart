import 'package:flutter/material.dart';
import 'package:scholar__app/auth/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_options.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../home/homepage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String id = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //       // User is signed out, show the Sign Up screen
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Signup()));
  //     }
  //   });
  // }

  bool IsLoding = false;
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: IsLoding,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                        height: 250,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 0, top: 0),
                        child: Container(
                            height: 300,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/scholar.png',
                              fit: BoxFit.fitHeight,
                            ))),
                  ),
                  Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Scholar_App",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  fontFamily: 'pacifico',
                                  color: Color.fromARGB(255, 144, 207, 232)),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  fontFamily: 'pacifico',
                                  color: Color.fromARGB(255, 144, 207, 232)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "يرجئ ادخال اسم المستخدم";
                                }
                                final emailRegex =
                                    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
                                if (!RegExp(emailRegex).hasMatch(value)) {
                                  return " ادخل الايميل بشكل صحيح";
                                }
                                return null;
                              },
                              controller: email,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 144, 207, 232),
                                  ),
                                  labelText: "Enter Email",
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 144, 207, 232),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 144, 207, 232),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 144, 207, 232),
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "يرجئ ادخال كلمة المرور ";
                                }
                                return null;
                              },
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 144, 207, 232),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Color.fromARGB(255, 144, 207, 232),
                                  ),
                                  labelText: "Enter Password",
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 144, 207, 232)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: InkWell(
                                      child: Text(
                                        "Are you have not an acount?",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 95, 92, 92)),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(Signup.id);
                                    },
                                    child: Text("Click Here",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 108, 203, 241))),
                                  )
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: MaterialButton(
                                onLongPress: () {},
                                color: Color.fromARGB(255, 105, 211, 252),
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    setState(() {});
                                    IsLoding = true;
                                    try {
                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: "${email.text.trim()}",
                                                  password:
                                                      "${password.text.trim()}");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  "تم تسجيل الدخول بنجاح")));
                                      setState(() {});
                                      Navigator.of(context)
                                          .pushReplacementNamed(chatpage.id);
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    "لا يوجد مستخدم بهذا الايميل الرجاء عمل تسجيل الدخول بالبداية")));
                                      } else if (e.code == 'wrong-password') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    "كلمة المرور غير صحيحة")));
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  "حدث خطأ ما الرجاء المحاولة مرة أخرى")));
                                    }
                                    // Navigator.of(context)
                                    //     .pushReplacementNamed("Homepage");
                                  }
                                  setState(() {});
                                  IsLoding = false;
                                  // return null;
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
