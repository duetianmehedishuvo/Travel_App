import 'package:flutter/material.dart';

class CustomListButton extends StatelessWidget {
   CustomListButton({
    Key? key,
    this.imageUrl,
    this.icon,
    required this.onTap
  }) : super(key: key);
  String? imageUrl;
  VoidCallback onTap;
  IconData?icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
 
      child: Image.asset("$imageUrl"),
      style: ElevatedButton.styleFrom(
          primary: Colors.white
        ),
      );
  }
}