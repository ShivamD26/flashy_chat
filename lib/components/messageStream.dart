import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'message_bubble.dart';

final _firestore = FirebaseFirestore.instance;

class MessageStream extends StatelessWidget {
  MessageStream({required this.loggedInUser});

  User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data?.docs.reversed;

            List<MessageBubble> messageBubbles = [];

            for (var message in messages!) {
              final msgTxt = message['text'];
              final msgSender = message['sender'];
              final currentUser = loggedInUser.email;

              final messageBubble = MessageBubble(
                  msgTxt: msgTxt,
                  msgSender: msgSender,
                  isMe: currentUser == msgSender);
              messageBubbles.add(messageBubble);
            }
            return Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                children: messageBubbles,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
