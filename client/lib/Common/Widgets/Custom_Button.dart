import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

   CustomButton({super.key,required this.text, required this.onTap});
String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
    );
  }
}