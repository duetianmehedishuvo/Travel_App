import 'dart:ui';

import 'package:demo/screens/restaurant%20_details/vendor_details.dart';
import 'package:demo/screens/utilitis/constant/color.dart';
import 'package:demo/screens/utilitis/submit_button.dart';
import 'package:demo/widgets/custom_list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                children: [
                 Container(
                   width: double.infinity,
                   height: 260,
                   child: Image.asset("assets/restaurent.png",fit: BoxFit.fitWidth,)
                   ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        onPressed: (){
                          
                        }, 
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                        )
                      ),
                    ),
                  ),
                     Positioned(
                    top: 40,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.more_horiz,color: Colors.white,)
                      ),
                    ),
                  ),
                   Positioned(
                    top: 90,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.photo_library_outlined,color: Colors.white,)
                      ),
                    ),
                  ),
                 Positioned(
                   right: 20,
                   bottom: 30,
                   child: SizedBox(
                    width: 110,
                    height: 36,
                    child: ElevatedButton(
                    onPressed: (){
                 
                    }, 
                    child: Text("Restuarant"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                      ),
                      primary: Colors.grey
                      ),
                      ),
                    ),
                 ),
        
                ],
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/1.4,
                color: Color(0xffE5E5E5),
                // color: Colors.red,
                child: Transform.translate(
                  offset: Offset(0, -20),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/1.62,
                    decoration: BoxDecoration(
                      color: Color(0xffE5E5E5),
                      borderRadius:BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      ) 
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               RatingBar.builder(
                                itemSize: 25,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,size: 5,
                                  color: Colors.orangeAccent,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                               Row(
                                 
                                 children: [
                                   CircleAvatar(
                                     radius: 25,
                                     backgroundColor: Colors.white,
                                     child: Image.asset("assets/youtube.png",)
                                     ),
                                     SizedBox(width: 10,),
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.white,
                                      child: Image.asset("assets/youtube_with.png",)
                                 ),
                                 ],
                               ),
                             ],
                           ) ,
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 "Tasty Restaurant",
                                 style: TextStyle(
                                   fontSize: 20
                                 ),
                               ),
                               SizedBox(height: 10,),
                               Row(
                                 children: [
                                   Icon(Icons.location_on,color: Colors.grey),
                                   Text(
                                     "Dhaka",
                                     style: TextStyle(
                                       fontSize: 20,
                                       color: Colors.grey
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                           SizedBox(height: 20,),
                           Text(
                              "Aura Raja Ampat Dive Resort is a hotel in a good neighborhood, which is located at...",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey
                              ),
                            ),
                            TextButton(
                              onPressed: (){}, 
                              child: Text(
                                "Read More..",
                                 style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey
                              ),
                              )
                            ),
                            SizedBox(height: 25,),
                           Divider(
                             thickness: 2,
                           ),
                            SizedBox(height: 25,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                                 
                               Column(
                                 children: [
                               
                                   SizedBox(
                                     width: 80,
                                     height: 65,
                                     child: ElevatedButton(
                                       onPressed: (){
                                         
                                       }, 
                                       child: Icon(Icons.menu_book,color: Colors.grey,size: 30,),
                                       style: ElevatedButton.styleFrom(
                                         shape: RoundedRectangleBorder(
                                           borderRadius:BorderRadius.circular(15) 
                                          ),
                                          primary: Colors.white
                                       ),
                                      ),
                                   ),
                                   Text(
                                    "Menu",
                                    style: TextStyle(
                                      color: Colors.grey
                                    ),
                                  )
                                 ],
                               ),
                               Column(
                                 children: [
                                   SizedBox(
                                     width: 80,
                                     height: 65,
                                     child: ElevatedButton(
                                       onPressed: (){
                                         
                                       }, 
                                       child: Icon(Icons.phone,color: Colors.grey,size: 30,),
                                       style: ElevatedButton.styleFrom(
                                         shape: RoundedRectangleBorder(
                                           borderRadius:BorderRadius.circular(15) 
                                          ),
                                          primary: Colors.white
                                       ),
                                      ),
                                   ),
                                   Text(
                                    "Contact",
                                    style: TextStyle(
                                      color: Colors.grey
                                    ),
                                  )
                                 ],
                               ),
                               Column(
                                 children: [
                                   SizedBox(
                                     width: 80,
                                     height: 65,
                                     child: ElevatedButton(
                                       onPressed: (){
                                         
                                       }, 
                                       child: Image.asset("assets/online_order.png"),
                                       style: ElevatedButton.styleFrom(
                                         shape: RoundedRectangleBorder(
                                           borderRadius:BorderRadius.circular(15) 
                                          ),
                                          primary: Colors.white
                                       ),
                                      ),
                                   ),
                                   Text(
                                    "Order Online",
                                    style: TextStyle(
                                      color: Colors.grey
                                    ),
                                  )
                                 ],
                               ),
                             ],
                           ),
                            SizedBox(height: 25,),
                                Container(
                                width: double.infinity,
                                height: 56,
                               
                                child:CustomButton(
                                  title: "Claim 50% Discount",size: 18, 
                                  color: PColor.submitButtonColor,
                                  onTap: (){},
                                  icon:Icons.arrow_forward ,
                                )
                              
                              ),
                              SizedBox(height: 25,),
                               Divider(
                             thickness: 2,
                           ),
                           SizedBox(height: 25,),
                           Image.asset("assets/burger.png",fit: BoxFit.fitWidth,),
                           SizedBox(height: 50,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
               
               SizedBox(height: 10,)
            
          ],
        ),
      ),
      
    );
  }
}