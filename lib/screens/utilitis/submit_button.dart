import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.onTap,
      this.icon,
      this.size,
      this.iconSize,
      this.tcolor,
      this.iconColor,
      this.borderRadius})
      : super(key: key);
  String title;
  Color color;
  Color? iconColor;
  Color? tcolor;
  IconData? icon;
  double? size;
  double? iconSize;
  VoidCallback onTap;
  BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: size, color: tcolor)),
          SizedBox(width: 5),
          // Icon(icon,color: iconColor,size:iconSize ,)
        ],
      ),
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), primary: color),
    );
  }
}
