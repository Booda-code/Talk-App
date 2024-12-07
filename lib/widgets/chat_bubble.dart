import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talk_app/models/message.dart';

class ChatBubble extends StatelessWidget {
   const ChatBubble({
    super.key,required this.message
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 32,bottom: 32,top: 32),
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
            color: kDefaultIconDarkColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32)
            )
        ),
        child: Text(message.message),
      ),
    );
  }
}


