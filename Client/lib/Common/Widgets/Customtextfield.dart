
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customtextfield extends StatelessWidget {
  TextEditingController controller =TextEditingController();
String hint;
    String labelText;
   Customtextfield({required this.hint,required this.labelText,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.purple)
      ),
      child: TextFormField(
        controller: controller,
    autofocus: true,
        decoration: InputDecoration(
      hintText: hint,
      labelText: labelText,

      ),
     validator: (value) {
       if(value!.isEmpty){
    return "enter $hint";
       }
       return null;
     },

      ),
    );
  }
}