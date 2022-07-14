

import 'package:flutter/material.dart';

class CustomContainerRoom extends StatelessWidget {
  final String image;
  final String tlabel;
  final String amountLabel;
  final String discountLabel;
  final String parcentageLabel;
  final String bedLabel;
  final String shift;
  final String? details;
  Color?color;
  IconData?icon;
  String?available_offer;
   CustomContainerRoom({
    Key? key,
   required this.image,
   required this.tlabel,
   required this.amountLabel,
   required this.discountLabel,
   required this.parcentageLabel,
   required this.bedLabel,
   required this.shift,
   this.color,
   this.details,
   this.icon,
   this.available_offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("$image"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       Text(
                       "$tlabel",
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.w700,
                         color: color
                       ),
                     ),
                      Row(
                        children: [
                          Icon(icon,color: Colors.grey),
                          Expanded(
                            child: Text(
                              "$details ",textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              
                              ),
                            ),
                          ),
                        ],
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text(
                                "$bedLabel",
                                style: TextStyle(
                                  color: Colors.grey
                                ),
                              ),
                               Text(
                                "$shift",
                                style: TextStyle(
                                  color: Colors.grey
                                ),
                              ),
                         ],
                       ),
                       SizedBox(height: 5,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Image.asset("assets/discount_badge.png",scale: 1.1,),
                    ),
                     Positioned(
                       top: 5,
                       left: 50,
                       child: Text(
                         "$parcentageLabel",
                         style: TextStyle(
                           // fontWeight: FontWeight.w700,
                           color: Colors.white,
                         ),
                       ),
                     ),
                  ],
                ),
                  Column(
                 children: [
                  Text(
                    "$available_offer",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                   Text(
               "$amountLabel",
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.w700,
                 color: Color(0xff08BA64)
               ),
             ),
               Text(
               "$discountLabel",
               style: TextStyle(
                 fontSize: 20,
                  decoration: TextDecoration.lineThrough,
                  color: Color(0xff08BA64)
               ),
             ),
                 ],
               )
              ],
            ),
          ),
          
          
        ],
      ),
      
    );
  }
}