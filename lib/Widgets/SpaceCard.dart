import 'package:flutter/material.dart';
import 'package:learningkos/model/Space.dart';
import 'package:learningkos/pages/DetailsPage.dart';
import 'package:learningkos/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  SpaceCard(this.space);
  // const SpaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsPage(space)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  space.imageUrl != null
                      ? Image.network(
                          space.imageUrl,
                          width: 130,
                          height: 110,
                          fit: BoxFit.cover,
                        )
                      : Container(),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36))),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon_star.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            "${space.rating}/5",
                            style: whiteTextStyle.copyWith(fontSize: 13),
                          )
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 2,
              ),
              Text.rich(
                TextSpan(
                    text: '\$${space.price}',
                    style: purpleTextStyle.copyWith(fontSize: 16),
                    children: [
                      TextSpan(
                        text: ' / month',
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    ]),
              ),
              SizedBox(
                height: 16,
              ),
              Text('${space.city}, ${space.country}', style: greyTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
