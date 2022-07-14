import 'package:flutter/material.dart';

class CustomClaimed extends StatelessWidget {
  const CustomClaimed({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: MediaQuery.of(context).size.height/2,
      width: double.infinity,
     child: SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           SizedBox(height: 10,),
              Text(
              "Successfully Claimed!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700
              ),
          ),
          Divider(
             thickness: 1.5,
            color: Colors.grey,
            indent: 160,
            endIndent: 160,
            ),
            SizedBox(height: 10,),
            Image.asset("assets/claim_photo.png"),
          Text(
            "You have successfully claimed the discount through DD Travel. To enjoy the discount, call Seagull Hotel and provide your discount id. You will get this amazing discount!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
           ),
          SizedBox(height: 25,),
          Divider(
            thickness: 1.5,
            color: Colors.grey,
          ),
          SizedBox(height: 25,),
         
              Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             SizedBox(
               height: 48,
               child: ElevatedButton.icon(
        onPressed: (){}, 
        icon: Icon(Icons.arrow_back,color:Colors.white,), 
        label: Text(
          "My Discounts",
          style: TextStyle(
            color: Colors.black,
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
        icon: Icon(Icons.phone), 
        label: Text(
          "Call the Hotel",
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
              SizedBox(height: 10,),
          
        
        
         ],
       ),
     ),
     
    );
  }
}
