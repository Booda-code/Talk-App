import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:talk_app/views/chat_screen.dart';
import 'package:talk_app/views/sign_up_view.dart';
import 'package:talk_app/widgets/custom_button.dart';

import '../widgets/custom_text_field.dart';

class SignInView extends StatefulWidget {
   SignInView({super.key});
   static String id = 'SignInView';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
   String? email;

   String? password;

   final GlobalKey<FormState> formKey = GlobalKey();

   bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Image.asset('assets/images/logo.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Talk',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                          fontStyle: FontStyle.italic,
                          color: Colors.white, // Set the color for "Talk"
                        ),
                      ),
                      TextSpan(
                        text: 'App',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue, // Set the color for "App"
                        ),
                      ),
                    ],
                  ),
                ),
              )
              ,CustomTextField(
                onChanged: (data) {
                  email = data;
                },
                text: 'Email', isPassword: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  password = data;
                },
                text: 'Password', isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(onPressed: () async{
                if (formKey.currentState!.validate()) {
                  isLoading = true;
                  setState(() {});
                  try {
                    await loginMethod();
                    Navigator.pushNamed(context, ChatScreen.id,arguments: email);
                  } on FirebaseAuthException
                  catch (ex) {
                   showSnackBar(context, 'incorrect Email or Password');
                  }
                  isLoading = false;
                  setState(() {});
                }
              },
                text: 'Sign In',),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('don\'t have an account ? ',style: TextStyle(fontSize: 18),),
                    GestureDetector(
                      onTap: ()
                      {
                      Navigator.pushNamed(context, SignUpView.id);
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

   void showSnackBar(BuildContext context,String message) {
     ScaffoldMessenger.of(context,).showSnackBar(
       SnackBar(
         content: Text(message),
       ),
     );
   }

   Future<void> loginMethod() async {
     UserCredential user = await FirebaseAuth.instance
         .signInWithEmailAndPassword(
         email: email!, password: password!);
   }
}
