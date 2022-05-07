import 'package:flutter/material.dart';
import 'package:learningkos/Providers/SpaceProvider.dart';
import 'package:learningkos/Widgets/BottomNavBarItem.dart';
import 'package:learningkos/Widgets/CityCard.dart';
import 'package:learningkos/Widgets/SpaceCard.dart';
import 'package:learningkos/Widgets/TipsCard.dart';
import 'package:learningkos/model/City.dart';
import 'package:learningkos/model/Space.dart';
import 'package:learningkos/model/Tips.dart';
import 'package:learningkos/pages/DetailsPage.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecommendedSpaces();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Explore Now",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Mencari kosan yang cozy",
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Popular Cities",
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(
                      City(
                        id: 1,
                        city: 'Jakarta',
                        ImageUrl: 'assets/city1.png',
                        isPopular: false,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                        id: 2,
                        city: 'Bandung',
                        ImageUrl: 'assets/city2.png',
                        isPopular: true,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                          isPopular: false,
                          id: 3,
                          city: 'Surabaya',
                          ImageUrl: 'assets/city3.png'),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                          isPopular: false,
                          id: 4,
                          city: 'Palembang',
                          ImageUrl: 'assets/city4.png'),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                          isPopular: true,
                          id: 5,
                          city: 'Aceh',
                          ImageUrl: 'assets/city5.png'),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                          isPopular: false,
                          id: 6,
                          city: 'Bogor',
                          ImageUrl: 'assets/city6.png'),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Recommended Place",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: EdgeInsets.only(left: edge),
                child: FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space>? data = snapshot.data as List<Space>?;
                      int index = 0;
                      return Column(
                          children: data!.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                          child: SpaceCard(item),
                        );
                      }).toList());
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Tips & Guidance",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(
                      Tips(1, "assets/tips1.png", "City Guidlines", "20 Apr")),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      2, "assets/tips2.png", "Jakarta Fairship", "11 Dec")),
                ],
              ),
            ),
            SizedBox(
              height: 60 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              ImageUrl: 'assets/icon_home.png',
              isActived: true,
            ),
            BottomNavBarItem(
              ImageUrl: 'assets/icon_email.png',
              isActived: false,
            ),
            BottomNavBarItem(
              ImageUrl: 'assets/icon_card.png',
              isActived: false,
            ),
            BottomNavBarItem(
              ImageUrl: 'assets/icon_love.png',
              isActived: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
