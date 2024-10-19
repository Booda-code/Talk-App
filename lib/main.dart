import 'package:flutter/material.dart';
import 'package:talk_app/views/sign_in_view.dart';

void main (){
  runApp(TalkApp());
}

class TalkApp extends StatelessWidget {
  const TalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home:SignInView() ,
    );
  }
}
