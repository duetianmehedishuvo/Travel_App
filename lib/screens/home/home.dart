import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/screens/auth/login.dart';
import 'package:demo/screens/restaurant%20_details/offer/offer_page.dart';
import 'package:demo/screens/restaurant%20_details/restaurant_page.dart';
import 'package:demo/screens/restaurant%20_details/vendor_details.dart';
import 'package:demo/screens/search.dart';
import 'package:demo/screens/auth/social_logo.dart';
import 'package:demo/screens/user_about/profile.dart';
import 'package:demo/screens/utilitis/constant/color.dart';
import 'package:demo/screens/utilitis/custom_textfield.dart';
import 'package:demo/widgets/custom_container_room.dart';
import 'package:demo/widgets/custom_list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  bool onPressed = false;

  List<String> sImage = [
    "assets/16taka.png",
    "assets/16taka.png",
    "assets/16taka.png",
    "assets/16taka.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage("https://www.w3schools.com/howto/img_avatar.png"),
                              radius: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hi, John!",
                                style: TextStyle(fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Dhaka",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
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
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              "assets/youtube_with.png",
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                              child: Icon(Icons.notifications_outlined)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 290,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                Icons.arrow_forward,
                                color: Color(0xff08BA64),
                                size: 30,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: "Where do you wanna go?",
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
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 80,
                          height: 56,
                          decoration: BoxDecoration(color: Color(0xff08BA64), borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Image.asset("assets/emergency.png"),
                                Text(
                                  "Emergency",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: home.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 65,
                              width: 85,
                              child: CustomListButton(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => home[index].screens!));
                                },
                                imageUrl: home[index].image,
                              ),
                            ),
                            Text(
                              home[index].title!,
                              style: TextStyle(
                                color: PColor.textColor,
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        child: Column(
                          children: [
                            Text(
                              "Offers for you",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Divider(
                              thickness: 1.5,
                              color: Colors.grey,
                              indent: 10,
                              endIndent: 100,
                            )
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              if (onPressed == false) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => OfferScreen()));
                              }
                            });
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.grey,
                            size: 30,
                          )),
                    ],
                  ),
                  CarouselSlider(
                      options: CarouselOptions(
                        height: 300,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        viewportFraction: 0.85,
                      ),
                      items: List<Widget>.generate(3, (index) => Image.asset(sImage[index % 2]))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        child: Column(
                          children: [
                            Text(
                              "Popular Deals",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Divider(
                              thickness: 1.5,
                              color: Colors.grey,
                              indent: 10,
                              endIndent: 100,
                            )
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.grey,
                            size: 30,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/segull.png"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Seagull Hotel",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      Text(
                                        "Cox’s Bazaar",
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Hotel",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Restaurent",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  RatingBar.builder(
                                    itemSize: 25,
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(Icons.star, size: 5, color: Colors.orangeAccent),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Image.asset(
                                  "assets/discount_badge.png",
                                  scale: 1.1,
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 50,
                                child: Text(
                                  "50%",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              Text(
                                "available offer",
                                style: TextStyle(
                                  // fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "6,000 tk",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xff08BA64)),
                              ),
                              Text(
                                "12,000 tk",
                                style: TextStyle(fontSize: 16, decoration: TextDecoration.lineThrough, color: Color(0xff08BA64)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class HomeButton {
  String? image;
  String? title;
  Widget? screens;

  HomeButton({this.image, this.title, this.screens});
}

List<HomeButton> home = [
  HomeButton(image: "assets/hotel.png", title: "Hotel/Resort", screens: SearchScreen()),
  HomeButton(image: "assets/restaurant.png", title: "Restaurant", screens: RestaurantScreen()),
  HomeButton(image: "assets/cruise.png", title: "Cruise", screens: RestaurantScreen()),
  HomeButton(image: "assets/flight.png", title: "Flight", screens: RestaurantScreen()),
];
