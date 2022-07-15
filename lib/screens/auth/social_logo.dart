import 'package:demo/screens/auth/login.dart';
import 'package:demo/screens/auth/registration.dart';
import 'package:demo/screens/utilitis/constant/color.dart';
import 'package:demo/screens/utilitis/social_logo_button.dart';
import 'package:demo/screens/utilitis/submit_button.dart';

import 'package:flutter/material.dart';

class SocialLogoScreen extends StatelessWidget {
  const SocialLogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/sign_back.jpeg"), fit: BoxFit.cover)),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/travel_logo.png"),
                      Column(
                        children: [
                          Text(
                            "Sign in to DD",
                            style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Colors.white.withOpacity(0.5),
                            thickness: 2,
                            indent: 160,
                            endIndent: 160,
                          ),
                          SizedBox(
                            height: 49,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: SocialLogoButton(
                                onTap: () {}, title: "Continue With Google", image: "assets/google.png", color: PColor.socialLogoButtonColor),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: SocialLogoButton(
                                onTap: () {}, title: "Continue With Facebook", image: "assets/facebook.png", color: PColor.socialLogoButtonColor),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: SocialLogoButton(
                                onTap: () {}, title: "Continue With Apple", image: "assets/apple.png", color: PColor.socialLogoButtonColor),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                              width: 194,
                              height: 46,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffEEEFED).withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: CustomButton(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => LogInScreen()));
                                  },
                                  title: "Continue with Google",
                                  size: 13,
                                  color: Color(0xffEEEFED).withOpacity(0.1))),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => RegistrationScreen()));
                            },
                            child: Text(
                              "Skip for now",
                              style: TextStyle(color: Color(0xffEEEFED).withOpacity(0.7)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
