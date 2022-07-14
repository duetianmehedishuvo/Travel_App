import 'package:demo/screens/home/home.dart';
import 'package:demo/screens/restaurant%20_details/offer/offer_page.dart';
import 'package:demo/screens/user_about/person.dart';

import 'package:demo/screens/restaurant%20_details/vendor_details.dart';
import 'package:demo/screens/search.dart';
import 'package:demo/screens/auth/login.dart';
import 'package:demo/screens/user_about/profile.dart';
import 'package:demo/screens/auth/social_logo.dart';
import 'package:demo/screens/home/welcome.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({ Key? key }) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  bool isTap1=false;
  bool isTap2=false;
  bool isTap3=false;
  bool isTap4=false;
  bool isTap5=false;
 
  int selectedIndex=0;
  List<Widget>screens=[
    HomeScreen(),
    SearchScreen(),
    OfferScreen(),
    ProfileScreen(),
    PersonScreen()
    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: 
      screens.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(

          
          items: [
            // BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            // BottomNavigationBarItem(icon: Icon(Icons.person),label: "person"),
            BottomNavigationBarItem(
              
               icon:Image.asset(
                "assets/home.png",
                ),
                label: "Home",
                ),
                 BottomNavigationBarItem(
                icon:Image.asset("assets/explor.png",),
                label: "Explore",
                ),
                BottomNavigationBarItem(
                icon:Image.asset("assets/gift_card.png"),
                label: "For You",
                ),
                 BottomNavigationBarItem(
                icon:Image.asset("assets/world_card.png"),
                label: "World",
                ),
              
                 BottomNavigationBarItem(
                icon:Image.asset("assets/person.png",color: Colors.grey,),
                label: "Account",
                ),
            
          ],
          
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          backgroundColor:Colors.white,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          // selectedIconTheme: IconThemeData(
          //   color: Colors.redAccent
          // ),
         
          onTap: (int index){
            setState(() {
              selectedIndex=index;
              
              
            });
          },
        ),
      ),
    );
  }
}
