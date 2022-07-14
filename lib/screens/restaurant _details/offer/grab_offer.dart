import 'package:flutter/material.dart';

class GrabOffer extends StatelessWidget {
  const GrabOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          child: Column(
           
            children: [
        Text(
          "Grab the Offer",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w700
          ),
    ),
    Divider(
      color: Colors.grey,
      thickness: 3,
      indent: 160,
      endIndent: 160,
    ),
    SizedBox(height: 25,),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 120,
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    child: Image.asset("assets/couple_room.png",fit: BoxFit.fill,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       Text(
                        "Couple Room",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700
                        ),
                       ),
                       Text(
                         "2 Bed  Night Stay ",
                         style: TextStyle(
                         fontSize: 12,
                         ),
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "12,000 tk",
                             style: TextStyle(
                               decoration:TextDecoration.lineThrough, 
                             fontSize: 12,
                             color: Color(0xff08BA64)
                             ),
                           ),
                           Row(
                         children: [
                           Text(
                         "6,000 tk",
                         style: TextStyle(
                            
                         fontSize: 16,
                         color: Color(0xff08BA64)
                         ),
                       ),
                       SizedBox(width: 10,),
                       Text(
                         "50% off",
                         style: TextStyle(
                            
                         fontSize: 16,
                         color: Color(0xffF4B806)
                         ),
                         )
      
                         ],
                       )
                         ],
                       ),
                       
                    ],
                  )
                ],
              ),
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
      Row(
      children: [
          Icon(Icons.check,color:Color(0xff08BA64) ),
          SizedBox(width: 10,),
          Text(
      "ABC Luxury Service",
      style: TextStyle(
           fontSize: 16,
           color: Colors.grey
      ),
           ),
      ],
           ),
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
    SizedBox(height: 25,),
           Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          SizedBox(
            height: 48,
            child: ElevatedButton.icon(
              onPressed: (){}, 
              icon: Icon(Icons.privacy_tip), 
              label: Text(
                "Privacy Policy",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff08BA64),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
           SizedBox(
      height: 48,
      child: ElevatedButton.icon(
          onPressed: (){}, 
          icon: Icon(Icons.privacy_tip), 
          label: Text(
            "How to get?",
             style: TextStyle(
            color: Colors.white
          ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xff08BA64),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
      ),
       ),
      ],
           ),
           SizedBox(height: 15,),
           Divider(
      color:Colors.grey,
      thickness: 3,
           ),
           SizedBox(height: 15,),
           Container(
      width: 250,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           Text(
          "Amount:",
            style: TextStyle(
          fontSize: 16,
          color: Colors.grey
          ),
      ),
      ElevatedButton(
          onPressed: (){}, 
          child: Icon(Icons.remove,),
           style: ElevatedButton.styleFrom(
             primary: Color(0xffD0D0D0).withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
            ),
          ),
           Text(
          "1",
            style: TextStyle(
          fontSize: 16,
          color: Colors.black
          ),
      ),
      ElevatedButton(
          onPressed: (){}, 
          child: Icon(Icons.add,),
           style: ElevatedButton.styleFrom(
             primary: Color(0xffD0D0D0).withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
            ),
          ),
          ],
      ),
           ),
           SizedBox(height: 15,),
           Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          SizedBox(
            height: 48,
            child: ElevatedButton(
            onPressed: (){}, 
            child: Text(
              "Contact for Booking",
              style: TextStyle(
                color: Colors.white
              ),
              ),
             style: ElevatedButton.styleFrom(
               primary: Color(0xff08BA64),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: ElevatedButton(
            onPressed: (){}, 
            child: Text(
              "Claim Discount",
              style: TextStyle(
                color: Colors.white
              ),
              ),
             style: ElevatedButton.styleFrom(
               primary: Color(0xff08BA64),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
              ),
            ),
          ),
      ],
           )
      
          ],
      ),
    ),
    SizedBox(height: 10,)
            
            ],
          ),
        ),
        
      );
  }
}


