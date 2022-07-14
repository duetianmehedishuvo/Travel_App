import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({ Key? key }) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {





  List <String>image = [
    "assets/16taka.png",
    "assets/surprise_gift.png",
    "assets/valentines.png",
  ];
  List<String>title= [
    "16 Taka Ticket",
    "Surprise Gift",
    "Valentines Special",
  ];
  
   
   

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
    
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, John!",
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          Text(
                            "Active",
                            style: TextStyle(
                              color: Color(0xff08BA64),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                   
                    children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.asset("assets/youtube_with.png",color: Colors.grey,),
                    ),
                    SizedBox(width: 10,),
                      Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.notifications_outlined)
                    ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                 Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: (){}, 
                        child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: Color(0xff08BA64),
                              size: 30,
                              ),
                            Text(
                              "My Discounts",
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffFFFFFF),
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                         ) 
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                   Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: (){}, 
                        child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: Color(0xff08BA64),
                              size: 30,
                              ),
                            Text(
                              "Pending Rewards",
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffFFFFFF),
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                         ) 
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
               Container(
                width: 250,
                
                child: Column(
                  children: [
                    Text(
                      "Ongoing Campaigns",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 22
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.grey,
                      indent: 25,
                      endIndent: 180,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.separated(
                  itemCount: image.length,
                  itemBuilder: (BuildContext,index){
                    return Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:Colors.white,
                      ),
                      
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio:1 ,
                        child: Image.asset(image[index],scale: 2.9,fit: BoxFit.cover,)
                        ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width/1.9,
                            color: Color.fromRGBO(205, 254, 230, 0.35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 Text(
                              title[index],
                              style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey
                              ),
                            ),
                            Text(
                              "Dhaka to Cox’s Bazaar bus ticket only for 16 taka.Spin the wheel to get this lucky discount!",
                               style: TextStyle(
                                color: Colors.grey
                              ),
                            ),
                            Text(
                              "16 December",
                              style: TextStyle(
                                color: Color(0xff08BA64),
                                fontSize: 16
                              ),
                            )
                               
                                  
                              ],
                            ),
                          ),
                          
                        ],
                      ), 
                      
                    ],
                   ) ,
                    );
                  }, 
                  separatorBuilder:  (BuildContext,index){
                    return SizedBox(height: 20);
                  }, 
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 250,
                
                child: Column(
                  children: [
                    Text(
                      "Upcoming Campaigns",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 22
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.grey,
                      indent: 25,
                      endIndent: 180,
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }


}