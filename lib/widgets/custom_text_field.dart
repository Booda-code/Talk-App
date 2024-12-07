import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    super.key, required this.text,this.onChanged, required this.isPassword
  });
   Function(String)? onChanged;
   final String text;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 70,
        child: TextFormField(
          obscureText: isPassword,
          validator: (data) {
            if(data!.isEmpty){
              return 'the field is required';
            }
            return null;
          },
          onChanged: onChanged,
            decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            labelText: text,
            hintText: 'Enter Your $text',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
          ),
        ),
      ),
    );
  }
}
