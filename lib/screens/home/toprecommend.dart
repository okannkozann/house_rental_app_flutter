import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:house_rental_app_flutter/constants.dart';
import 'package:house_rental_app_flutter/model/house.dart';
import 'package:house_rental_app_flutter/screens/detail/detail_screen.dart';

class TopRecommended extends StatelessWidget {
  const TopRecommended({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 345,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendedList.length,
        itemBuilder: (context, index) {
          final rent = recommendedList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => DetailScreen(rent: rent),
                ),
              );
            },
            child: Container(
              height: 300,
              width: 250,
              margin: EdgeInsets.only(
                left: 20,
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  //for image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          rent.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white30,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rent.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: titleTextColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  rent.address,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: titleTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          circularBox("assets/icons/heart.svg"),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: circularBox("assets/icons/mark.svg"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container circularBox(image) {
    return Container(
      height: 25,
      width: 25,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: secondaryColor, shape: BoxShape.circle),
      child: SvgPicture.asset(image),
    );
  }
}
