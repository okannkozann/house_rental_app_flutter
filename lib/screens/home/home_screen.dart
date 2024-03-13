import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:house_rental_app_flutter/constants.dart';
import 'package:house_rental_app_flutter/screens/home/best_offer.dart';
import 'package:house_rental_app_flutter/screens/home/category.dart';
import 'package:house_rental_app_flutter/screens/home/toprecommend.dart';
import 'package:house_rental_app_flutter/widget/bottom_nav_bar.dart';
import 'package:house_rental_app_flutter/widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // for bottom navigation bar
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //for profile and menu
              profileAndMenu(),
              //introduction text
              IntroductionText(),
              // for search bar
              MySearchBar(),
              //for category
              Category(),
              SizedBox(
                height: 20,
              ),
              // for image and more
              TopRecommended(),
              // best offer
              BestOffer(),
            ],
          ),
        ),
      ),
    );
  }

  Container IntroductionText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello Okan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black45,
              fontSize: 16,
            ),
          ),
          Text(
            "Find your sweet Home",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: titleTextColor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Padding profileAndMenu() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("assets/icons/menu.svg"),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.png"),
          )
        ],
      ),
    );
  }
}
