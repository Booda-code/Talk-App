import 'package:flutter/material.dart';
import 'package:talk_app/views/sign_up_view.dart';

import '../widgets/custom_text_field.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          Text(
            'Talk App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
          ),
          SizedBox(
            height:50,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 325, bottom: 5),
            child: Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          CustomTextField(
            text: 'Email',
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            text: 'Password',
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 375,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Sign In',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('don\'t have an account ',style: TextStyle(fontSize: 18),),
                GestureDetector(
                  onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpView()));},
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
    );
  }
}
