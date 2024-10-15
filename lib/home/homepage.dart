import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar__app/models/message.dart';
import '../constans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constans.dart';
import '../widgets/chat_bubble.dart';

class chatpage extends StatefulWidget {
  const chatpage({super.key});
  static String id = 'chat_page';

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  ScrollController _scroolcontriller = new ScrollController();
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  TextEditingController massages_controller = new TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference massages =
      FirebaseFirestore.instance.collection(massagescollaction);
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  getdatamessage() {
    var data = massages.orderBy(descending: true, 'timestamp').snapshots();
    return data;
  }

  Future<dynamic> getdatausers() async {
    var data = await users.snapshots();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: getdatamessage(),
        builder: (context, snapshot) {
          // print(massages.snapshots().distinct());
          if (snapshot.hasData) {
            List<Message> messageslist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageslist.add(Message.fromjson(snapshot.data!.docs[i]));
              // messageslist.sort(
              //   (a, b) {
              //     return massages.
              //   },
              // );
              // print(snapshot.data!.docs[i]['text']);
            }

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: primarycolor_const,
                centerTitle: true,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(height: 70, child: Logo()),
                    Text(
                      "Chat",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        setState(
                            () {}); // force update to remove old user from state
                        Navigator.of(context).pushReplacementNamed('login');
                        // Navigator.pop(context); // navigate back to login page
                      },
                      icon: Icon(Icons.logout))
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                      reverse: true,
                      controller: _scroolcontriller,

                      // shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int i) {
                        if (FirebaseAuth.instance.currentUser!.email ==
                            snapshot.data!.docs[i]['id']) {
                          return chat_bubble(massage: messageslist[i]);
                        } else {
                          return chat_bubble_from_another(
                            massage: messageslist[i],
                            nameuser: snapshot.data!.docs[i]['id'],
                          );
                        }
                      },
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Form(
                            key: formkey,
                            child: TextFormField(
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return ;
                              //   }
                              // },
                              controller: massages_controller,
                              decoration: InputDecoration(
                                  hintText: 'ارسل الرسالة',
                                  suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor: primarycolor_const,
                                        child: InkWell(
                                          onTap: () {
                                            // print(user!.email);
                                            if (formkey.currentState!
                                                .validate()) {
                                              massages.add({
                                                'id': user!.email,
                                                'text':
                                                    massages_controller.text,
                                                'timestamp': FieldValue
                                                    .serverTimestamp(),
                                              });
                                              setState(() {
                                                massages_controller.clear();
                                              });
                                              _scroolcontriller.animateTo(0,
                                                  duration:
                                                      Duration(seconds: 1),
                                                  curve: Curves.fastOutSlowIn);
                                            }
                                          },
                                          child: Icon(
                                            Icons.send,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            );

            // return CircularProgressIndicator();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
