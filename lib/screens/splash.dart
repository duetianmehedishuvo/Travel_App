import 'dart:async';


import 'package:demo/screens/home/welcome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Welcome())));
      
 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
           decoration: BoxDecoration(
               image: DecorationImage(
              image: AssetImage("assets/sback.png"),
              fit: BoxFit.cover
            )
          ),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Image.asset("assets/travel_logo.png",scale: 0.5,),
                Text(
                  "Travel Made Simple",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                ),
              ],
            ),
          ),
          
        ),
      )
    );
  }
}