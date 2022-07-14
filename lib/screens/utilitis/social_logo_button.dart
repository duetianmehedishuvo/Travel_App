import 'package:flutter/material.dart';

class SocialLogoButton extends StatelessWidget {
  final VoidCallback?onTap;
   String image;
   String title;
   Color color;
   SocialLogoButton({
    Key? key,
    this.onTap,
    required this.image,
    required this.title,
    required this.color
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      child: Row( 
        children: [
          Transform.translate(
            offset: Offset(-15, 0),
            child: CircleAvatar(
              radius: 25,
              child: Image.asset("$image",scale: 4,),
              backgroundColor: Colors.white,
            ),
          ),
          Text(
            title
          ),
        ],
      ),
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      ),
      primary: color
      ),
      );
  }
}
