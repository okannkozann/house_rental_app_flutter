import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:house_rental_app_flutter/constants.dart';
import 'package:house_rental_app_flutter/model/house.dart';
import 'package:house_rental_app_flutter/screens/detail/house_detail.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.rent});

  final House rent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailImage(context),
            SizedBox(
              height: 20,
            ),
            // for house name, address, location, price
            houseInfo(),
            SizedBox(
              height: 20,
            ),
            //more detail
            HouseDetail(),
            SizedBox(
              height: 25,
            ),
            // for about
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: titleTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    rent.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: bodyTextColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 45,
              alignment: Alignment.center,
              child: Text(
                "Book now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container houseInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rent.name,
            style: TextStyle(
              color: titleTextColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            rent.address,
            style: TextStyle(
              color: titleTextColor,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "50000 sqf",
            style: TextStyle(
              color: titleTextColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: rent.price,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "Fer month"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox detailImage(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Image.asset(
            rent.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //for back button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_circle_left_sharp,
                    color: Colors.white70,
                  ),
                ),
                //for bookmark button
                Container(
                  height: 25,
                  width: 25,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: secondaryColor, shape: BoxShape.circle),
                  child: SvgPicture.asset("assets/icons/mark.svg"),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
