import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talk_app/views/chat_screen.dart';
import 'package:talk_app/views/sign_in_view.dart';
import 'package:talk_app/views/sign_up_view.dart';

import 'firebase_options.dart';

void main () async{
  runApp(const TalkApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

}
class TalkApp extends StatelessWidget {
  const TalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignUpView.id : (context) => SignUpView(),
        SignInView.id : (context) => SignInView(),
        ChatScreen.id : (context) => ChatScreen(),
      },
      initialRoute: SignInView.id,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
