

import 'package:demo/screens/restaurant%20_details/offer/grab_offer.dart';
import 'package:demo/widgets/custom_claimed.dart';
import 'package:demo/widgets/custom_contact.dart';
import 'package:demo/widgets/custom_container_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VendorDetailsScreen extends StatefulWidget {
   VendorDetailsScreen({ Key? key }) : super(key: key);

  @override
  State<VendorDetailsScreen> createState() => _VendorDetailsScreenState();
}

class _VendorDetailsScreenState extends State<VendorDetailsScreen> {


List<String>image = [
    
    "assets/couple_room.png",
    "assets/single_room.png",
    "assets/couple_room.png",
    "assets/single_room.png",


  ];
  List<String>title= [
    
    "Couple Room",
    "Single Room",
    "Couple Room",
    "Single Room",

  ];



   var bottomSheetController;

   bool isOpen = false;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: 100,
                    height: 36,
                    child: ElevatedButton(
                    onPressed: (){
                 
                    }, 
                    child: Text("Hotel"),
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
              Transform.translate(
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
                                color: Colors.orangeAccent
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
                                     GestureDetector(
                                       onTap: (){
                                         _showModalBottomSheetContact();
                                       },
                                       child: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.phone,color: Color(0xff08BA64),
                                          )
                                          ),
                                     ),
                                    ],
                                  ),
                                    
                                ],
                              ) ,
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               "Seagull Hotel",
                               style: TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.w700
                               ),
                             ),
                             SizedBox(height: 10,),
                             Row(
                               children: [
                                 Icon(Icons.location_on,color: Colors.grey),
                                 Text(
                                   "Cox’s Bazaar",
                                   style: TextStyle(
                                     fontSize: 16,
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
                       
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                  "Available Offers",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                 
                                   Row(
                                 children: [
                                CircleAvatar(
                                   radius: 20,
                                   backgroundColor: Colors.white,
                                   child: IconButton(
                                     onPressed: (){}, 
                                     icon: Icon(Icons.date_range_outlined,color: Colors.grey,),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                     Text(
                                  "Change Date",
                                  style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey
                                  ),
                                ),
                                 ],
                                   )
                                ],
                              ),
                             Container(
                               width: 100,
                               height: 42,
                               padding: EdgeInsets.only(left: 15),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(15)
                               ),
                               child: Row(
                                 children: [
                                   
                                   GestureDetector(
                                     onTap: (){},
                                     child: Text("More")),
                                   IconButton(
                                     
                                   onPressed: (){
                                     _showModalBottomSheet();
                                   },
             
                                     
                                     icon: Icon(Icons.arrow_forward_ios,color: Color(0xff08BA64))
                                    )
                                 ],
                               ),
                             )
                           ],
                         ),
                         SizedBox(height: 10,),







                        Container(
                        width: double.infinity,
                        height: 260,
                         decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                _showModalBottomSheetDiscount();
                              },
                              child: CustomContainerRoom(
                                image: "assets/couple_room.png", 
                                tlabel: "Couple Room", 
                                amountLabel: "6,000 tk", 
                                discountLabel: "12,000 tk", 
                                parcentageLabel: "50%", 
                                bedLabel: "2 Bed",
                                shift: "Night Stay",
                                details: "A luxurious 2 bed room. With amazing services and luxury...",
                                available_offer:"available_offer" ,
                              ),
                            ),
                            SizedBox(height: 10,),
                            CustomContainerRoom(
                           image: "assets/single_room.png", 
                           tlabel: "Single Room", 
                           amountLabel: "4,000 tk", 
                           discountLabel: "7,000 tk", 
                           parcentageLabel: "40%", 
                           bedLabel: "1 Bed",
                           shift: "Night Stay",
                           details: "A luxurious 2 bed room. With amazing services and luxury...",
                           available_offer:"available_offer" ,
                          ),
                            ],
                          ),
                        ),
                        
                         SizedBox(height: 20,),
                         
                          
                  
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),
                ),
                  SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.check,color:Color(0xff08BA64) ),
                        SizedBox(width: 10,),
                        Text(
                      "Laundry Service",
                      style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                      ),
                    ),
                      ],
                    ),
                ],
            ),
              ),
                  SizedBox(height: 10,),
            
          ],
        ),
      ),
      
    );
  }
    _showModalBottomSheet(){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            alignment: Alignment.center,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                  "Available Offers",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),
              ),
                ),
               Expanded(
                 child: ListView.separated(
                   itemCount: image.length,
                   itemBuilder: (BuildContext, index){
                     return Column(
                       children: [
                         
                         CustomContainerRoom(
                            image: image[index], 
                            tlabel: title[index], 
                            amountLabel: "6,000 tk", 
                            discountLabel: "12,000 tk", 
                            parcentageLabel: "50%", 
                            bedLabel: "2 Bed",
                            shift: "Night Stay",
                            details: "A luxurious 2 bed room. With amazing services and luxury...",
                            available_offer: "available offer",
                          ),
                         SizedBox(height: 10,),
                        
                       ],
                     );
                     
                   },
                   separatorBuilder: (BuildContext,index){
                     return SizedBox(height: 10,);
                   },
                  ),
               ),
             ],
           ),
           
          );
        },
    );
  }
  _showModalBottomSheetDiscount(){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
           child: GrabOffer(),
           
          );
        },
    );
  }
  _showModalBottomSheetContact(){
    showModalBottomSheet(
      backgroundColor: Color(0xffE5E5E5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
        context: context,
        builder: (context) {
          return CustomContact();
        },
    );
  }
  
}


