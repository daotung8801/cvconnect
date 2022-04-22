import 'dart:developer';
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/components/SmallHeaderWidget.dart';
import 'package:cvconnect/components/TitleText1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Service service = Service();

  final storeMessage = FirebaseFirestore.instance;

  final auth = FirebaseAuth.instance;
  TextEditingController msg = TextEditingController();

  getCurrentUser() {
    final user = auth.currentUser;

    if (user != null) {
      loginUser = user;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmallHeaderWidget(
          text: loginUser!.phoneNumber.toString(),
          icon: Icon(Icons.arrow_back)),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Text("Messages"),
            Container(
                height: 500,
                //child: ShowMessages(),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  reverse: true,
                  child: ShowMessages(),
                )),
            Row(children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Colors.blue, width: 0.2),
                  )),
                  child: TextField(
                    controller: msg,
                    decoration: InputDecoration(
                      hintText: "Nhập tin nhắn...",
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (msg.text.isNotEmpty) {
                      storeMessage.collection('Messages').doc().set({
                        "messages": msg.text.trim(),
                        "user": loginUser!.phoneNumber.toString(),
                        "time": DateTime.now(),
                      });
                      msg.clear();
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.teal,
                  ))
            ]),
          ]),
    );
  }
}

class ShowMessages extends StatelessWidget {
  const ShowMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Messages")
            .orderBy("time")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              primary: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, i) {
                QueryDocumentSnapshot x = snapshot.data!.docs[i];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: loginUser!.phoneNumber == x['user']
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: loginUser!.phoneNumber == x['user']
                                  ? Colors.blue.withOpacity(0.2)
                                  : Colors.amber.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(x['messages']),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                x["user"],
                                style: TextStyle(
                                    fontSize: 10, color: Colors.green),
                              )
                            ],
                          ))
                    ],
                  ),
                );
              });
        });
  }
}
