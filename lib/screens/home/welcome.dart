import 'package:demo/screens/auth/login.dart';
import 'package:demo/screens/utilitis/constant/color.dart';
import 'package:demo/screens/utilitis/submit_button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/sign_back.jpeg"), fit: BoxFit.cover)),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/travel_logo.png"),
                  Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Welcome to the",
                            style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "World of Discounts",
                            style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Make your travel simple.Get awesome deals and save more than 60% of travel cost! Enjoy youre Traveling!",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: Colors.white.withOpacity(0.5),
                            thickness: 2,
                            indent: 130,
                            endIndent: 130,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                              child: CustomButton(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => LogInScreen()));
                                  },
                                  title: "Get Started",
                                  size: 18,
                                  color: PColor.submitButtonColor,
                                  icon: Icons.arrow_forward)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
