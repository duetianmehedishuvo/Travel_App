import 'package:demo/utilites/colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield1 extends StatelessWidget {
  CustomTextfield1(
      {Key? key, required this.Controller, required this.color, required this.title, required this.obscureText, required this.readOnly, this.icon})
      : super(key: key);

  final TextEditingController Controller;
  Color color;
  String title;
  bool obscureText = false;
  bool readOnly = false;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      obscureText: obscureText,
      controller: Controller,
      style: TextStyle(color: whiteColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: color,
        suffixIcon: icon,
        labelStyle: TextStyle(color: Colors.white),
        hintText: title,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(.6),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
          borderRadius: BorderRadius.circular(27.5),
        ),
        disabledBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
