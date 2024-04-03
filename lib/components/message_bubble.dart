import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.isMe,
    this.msgTxt,
    this.msgSender,
  });

  var msgTxt;
  bool isMe;
  var msgSender;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.all(10),
      child: Column(

          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              msgSender,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            Material(
              color: isMe ? Colors.deepPurple[300] : Colors.grey[600],
              borderRadius: isMe
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(26))
                  : BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(26)),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '$msgTxt',
                  style: TextStyle(
                    fontSize: 17.5,
                    color: Colors.white ,
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
