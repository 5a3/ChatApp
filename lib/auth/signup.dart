import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar__app/home/homepage.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);
  static String id = 'Singup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool IsLoding = false;
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  var auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: IsLoding,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 230,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 0, top: 0),
                      child: Container(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            'assets/images/scholar.png',
                            fit: BoxFit.fitHeight,
                          )),
                    ),
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
                              "SignUp",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  fontFamily: 'pacifico',
                                  color: Color.fromARGB(255, 144, 207, 232)),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(4.0),
                          //   child: TextFormField(
                          //     validator: (value) {
                          //       if (value!.isEmpty) {
                          //         return "يرجئ ادخال اسم المستخدم";
                          //       }
                          //       return null;
                          //     },
                          //     controller: username,
                          //     decoration: InputDecoration(
                          //         focusColor: Color.fromARGB(255, 144, 207, 232),
                          //         prefixIcon: Icon(
                          //           Icons.person,
                          //           color: Color.fromARGB(255, 144, 207, 232),
                          //         ),
                          //         labelText: "Enter UserName",
                          //         labelStyle: TextStyle(
                          //             color: Color.fromARGB(255, 144, 207, 232)),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //               color: Color.fromARGB(255, 144, 207, 232),
                          //             ),
                          //             borderRadius: BorderRadius.circular(10)),
                          //         border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(10))),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "يرجئ ادخال الايميل";
                                }
                                final emailRegex =
                                    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
                                if (!RegExp(emailRegex).hasMatch(value)) {
                                  return " ادخل الايميل بشكل صحيح";
                                }
                              },
                              controller: email,
                              decoration: InputDecoration(
                                  focusColor:
                                      Color.fromARGB(255, 144, 207, 232),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color.fromARGB(255, 144, 207, 232),
                                  ),
                                  labelText: "Enter Email",
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 144, 207, 232)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 144, 207, 232),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
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
                                  focusColor:
                                      Color.fromARGB(255, 144, 207, 232),
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
                                        "Are have acount?",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 95, 92, 92)),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
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
                                color: Color.fromARGB(255, 108, 203, 241),
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    setState(() {});
                                    IsLoding = true;
                                    try {
                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .createUserWithEmailAndPassword(
                                                  email: "${email.text}",
                                                  password: "${password.text}");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  "تم انشاء الحساب بنجاح")));
                                      Navigator.of(context)
                                          .pushReplacementNamed(chatpage.id);
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'weak-password') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.red,
                                                content:
                                                    Text("كلمه السر ضعيفة")));
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    "الحساب موجود بالفعل")));
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(e.toString())));
                                    }
                                    // Navigator.of(context).pop();
                                  }
                                  setState(() {});

                                  IsLoding = false;
                                  return null;
                                },
                                child: Text(
                                  "Signup",
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
