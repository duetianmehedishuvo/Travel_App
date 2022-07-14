import 'dart:developer';
import 'package:demo/animation/slideleft_toright.dart';
import 'package:demo/animation/slideright_toleft.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class Helper {
  static setHeight(BuildContext context, {height: 1}) {
    return MediaQuery.of(context).size.height * height;
  }

  static setWidth(BuildContext context, {width: 1}) {
    return MediaQuery.of(context).size.width * width;
  }

  static toScreen(context, screen) {
    Navigator.push(context, SlideRightToLeft(page: screen));
  }

  static toReplacementScreenSlideRightToLeft(context, screen) {
    Navigator.pushReplacement(context, SlideRightToLeft(page: screen));
  }

  static toReplacementScreenSlideLeftToRight(context, screen) {
    Navigator.pushReplacement(context, SlideLeftToRight(page: screen));
  }

  static toRemoveUntiScreen(context, screen) {
    Navigator.pushAndRemoveUntil(context, SlideRightToLeft(page: screen), (route) => false);
  }

  static onWillPop(context, screen) {
    Navigator.pushAndRemoveUntil(context, SlideRightToLeft(page: screen), (route) => false);
  }

  static showSnack(context, message, {color: kPrimaryColor, duration = 2}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message, style: TextStyle(fontSize: 14)), backgroundColor: color, duration: Duration(seconds: duration)));
  }

  static circulProggress(context) {
    const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(kAccentColor)));
  }

  static showLog(message) {
    log("APP SAYS: $message");
  }

  static boxDecoration(Color color, double radius) {
    BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
