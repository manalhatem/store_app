import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({Key? key,this.type, this.hintText, this.onChanged , this.obscureText =false}) : super(key: key);
  Function(String)? onChanged;
  String? hintText;
  TextInputType ? type;

  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:obscureText!,
      // validator: (data) {
      //   if (data!.isEmpty) {
      //     return 'field is required';
      //   }
    //  },
    keyboardType: type,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
       
        enabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        border: OutlineInputBorder(
          borderSide:const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}