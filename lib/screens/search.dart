

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/screens/restaurant%20_details/restaurant_page.dart';
import 'package:demo/screens/restaurant%20_details/vendor_details.dart';
import 'package:demo/screens/auth/social_logo.dart';
import 'package:demo/screens/home/welcome.dart';
import 'package:demo/widgets/custom_container_room.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({ Key? key }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

bool isTap =false;

  TextEditingController _dobController = TextEditingController();
  List<String>image=[
    "assets/couple_room.png",
    "assets/single_room.png",
    "assets/couple_room.png",
    "assets/single_room.png",
    "assets/couple_room.png",
    "assets/single_room.png",
  ];
  
  List<String>hotelName =[
    "Seagull Hotel",
    "VistaBay Resort",
    "Abc Hotel Service",
    "Seagull Hotel",
    "VistaBay Resort",
    "Abc Hotel Service",
    
   
  ];
  List<String>location =[
    "Cox’s Bazaar",
    "Chattogram",
    "Dhaka",
    "Cox’s Bazaar",
    "Chattogram",
    "Dhaka",
   
  ];
  List<String>beforePrice =[
    "12,000 tk",
    "20,000 tk",
    "12,000 tk",
     "12,000 tk",
    "20,000 tk",
    "12,000 tk",
  ];
    List<String>afterPrice =[
       "6,000 tk",
    "12,000 tk",
    "4,000 tk",
    "6,000 tk",
    "12,000 tk",
    "4,000 tk",
    
  ];
  List<String>parcentageLabel =[
    "50%",
    "50%",
    "60%",
   "50%",
    "50%",
    "60%",
  ];
  List<String>place =[
    "Hotel",
    "Resort",
    "Resort",
    "Hotel",
    "Resort",
    "Resort",
  ];


  







   Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 20),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year));
    if (picked != null)
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
     
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
                      top: 150,
                      left: 10,
                      child: Text(
                      """Where do 
you wanna go?""",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                      ),
                    ),
                     Positioned(
                      top: 150,
                      right: 10,
                       child: Column(
                        children: [
                        OutlinedButton(
                        onPressed: (){}, 
                        child: Image.asset("assets/rainy.png"),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                                         ),
                                         Text(
                        "Rainy",
                        style: TextStyle(
                          color: Colors.white
                        ),
                                         )
                        ],
                                         ),
                     ),
                  SizedBox(width: 3,)
                     
                  //  Positioned(
                  //   top: 150,
                  //   right: 20,
                  //   child:
                  // ),
                 
                ],
              ),
              
              Transform.translate(
                offset: Offset(0, -20),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height/1.62,
                      decoration: BoxDecoration(
                        color: Color(0xffE5E5E5),
                        borderRadius:BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        ) 
                      ),
                      
                    ),
                    Transform.translate(
                      offset: Offset(0, -20),
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                            width: 310,
                            height: 50,
                            child: TextFormField(
                                                          
                              decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.location_on_outlined),
                                    labelStyle: TextStyle(color: Colors.white,),
                                    hintText: "Select Destination",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  border: OutlineInputBorder(
                                    
                                    borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              disabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(16),
                              ),                      
                                ),
                              ),
                            ),
                    
                           InkWell(
                             onTap: (){
                              _showModalBottomSheetContact(BuildContext, context);
                             },
                             child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff08BA64),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Image.asset("assets/book.png",),
                              ),
                           ),
                            
                            ],
                           ),
                           SizedBox(height: 10,),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                        width: 310,
                        height: 50,
                        child: TextFormField(
                            style: TextStyle(color: Colors.grey),
                            readOnly: true,
                            controller: _dobController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: " Date of Birth ",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              
                              prefixIcon: IconButton(
                                onPressed: () => _selectDateFromPicker(context),
                                icon: Icon(Icons.calendar_today_outlined,
                                color: Colors.grey
                                ),
                              ),
                            
                              
                               border: OutlineInputBorder(
                                    
                                    borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              disabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              
                            ),
                          ),
                        ),
                         
                    
                      Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image.asset("assets/icon_slider.png",),
                          ),
                        ],
                    ),
                    SizedBox(height: 10,),
                    Divider(
                        color: Colors.grey.withOpacity(0.3),
                        thickness: 1.5,
                        indent: 15,
                        endIndent: 15,
                    ),
                    SizedBox(height: 10,),
                    Container(
                height: 90,
                color: Color(0xffE5E5E5),
                child: ListView(
                  
                  scrollDirection: Axis.horizontal,
                  children: [
                     Column(
                       children: [
                         SizedBox(
                          height: 65,
                          width: 85,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>VendorDetailsScreen()));
                            }, 
                            child: Image.asset("assets/hotel.png"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                
                                
                              ),
                            ),
                         ),
                         Text(
                           "Hotel/Resort",
                           style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                       ],
                     ),
                     SizedBox(width: 35,),
                     Column(
                       children: [
                         SizedBox(
                          height: 65,
                          width: 85,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>RestaurantScreen()));
                            }, 
                            child: Image.asset("assets/restaurant.png"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white
                              ),
                            ),
                         ),
                         Text(
                           "Restaurant",
                           style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                       ],
                     ),
                    SizedBox(width: 35,),
                      Column(
                       children: [
                         SizedBox(
                          height: 65,
                          width: 85,
                          child: ElevatedButton(
                            onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (_)=>RestaurantScreen()));
                            }, 
                            child: Image.asset("assets/cruise.png"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white
                              ),
                            ),
                         ),
                         Text(
                           "Cruise",
                           style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                       ],
                     ),
                    SizedBox(width: 35,),
                      Column(
                       children: [
                         SizedBox(
                          height: 65,
                          width: 85,
                          child: ElevatedButton(
                            onPressed: (){}, 
                            child: Image.asset("assets/flight.png"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white
                              ),
                            ),
                         ),
                         Text(
                           "Flight",
                           style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                       ],
                     ),
                  ],
                ),
              ),
                  
                    Container(
                        width: double.infinity,
                        height: 400,
                     
                        child: ListView.separated(
                   itemCount: hotelName.length,
                   itemBuilder: (BuildContext, index){
                     return 
                        Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(16)
                        ),
                        child: CustomContainerRoom(
                          image: image[index], 
                          tlabel: hotelName[index], 
                          amountLabel: afterPrice[index], 
                          discountLabel: beforePrice[index], 
                          parcentageLabel: "50%", 
                          bedLabel: "Hotel", 
                          shift: "Restaurant",
                          icon: Icons.location_on,
                          details:location[index] ,
                          available_offer: "available offer",
                        )
                      );  
                   },
                   separatorBuilder: (BuildContext,index){
                     return SizedBox(height: 10,);
                   },
                  ),    
                    )
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
             
            
          ],
        ),
      ),
      
    );
  }
  _showModalBottomSheetContact(BuildContext,context){
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                "Select Area",
                style: TextStyle(
                  fontSize: 20,
                    
                    
                ),
              ),
              Divider(
                thickness: 1.5,
                color: Colors.grey.withOpacity(0.5),
              ),
               Image.asset("assets/map.png"),
                Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SocialLogoScreen()));
                    }, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      
                        Text(
                          "Use my Location",
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      primary: Color(0xff08BA64)
                    ),
                  ),
                  ),
              
              ],
            ),
          );
        },
    );
  }
  
}
