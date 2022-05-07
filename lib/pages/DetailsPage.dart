import 'package:flutter/material.dart';
import 'package:learningkos/Widgets/FacilityCard.dart';
import 'package:learningkos/Widgets/RatingItem.dart';
import 'package:learningkos/model/Space.dart';
import 'package:learningkos/pages/ErrorPage.dart';
import 'package:learningkos/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  // const DetailsPage({Key? key}) : super(key: key);

  final Space space;
  DetailsPage(this.space);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            widget.space.imageUrl != null
                ? Image.network(
                    widget.space.imageUrl,
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    fit: BoxFit.cover,
                  )
                : Container(),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 100,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: edge,
                            // vertical: edge,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.name,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                        text: '\$${widget.space.price}',
                                        style: purpleTextStyle.copyWith(
                                            fontSize: 16),
                                        children: [
                                          TextSpan(
                                            text: ' / month',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: RatingItem(
                                      index: index,
                                      rating: widget.space.rating,
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          "Main Facilities",
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityCard(
                              imageUrl: "assets/icon_kitchen.png",
                              name: "kitchen",
                              total: widget.space.numberOfKitchens,
                            ),
                            FacilityCard(
                              imageUrl: "assets/icon_bedroom.png",
                              name: "bedroom",
                              total: widget.space.numberOfBedrooms,
                            ),
                            FacilityCard(
                              imageUrl: "assets/icon_cupboard.png",
                              name: "Big Lemari",
                              total: widget.space.numberofCupboards,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.space.photos.map((items) {
                            return Container(
                              margin: EdgeInsets.only(left: 24),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  items,
                                  width: 110,
                                  height: 88,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          "Location",
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Jln. Kappan Sukses No. 20 \nPalembang",
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl("asd.cds");
                                // ("https://www.google.com/maps/place/CLUSTER+PANDAN+Safril's+house/@-6.1752193,106.6936222,17z/data=!3m1!4b1!4m5!3m4!1s0x2e69f8496225e7ad:0x791810d8b5a80c6d!8m2!3d-6.1752168!4d106.6958149?hl=id");
                              },
                              child: Image.asset(
                                "assets/btn_map.png",
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        height: 50,
                        child: RaisedButton(
                          color: purpleColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                title: const Text('Konfirmasi'),
                                content: const Text(
                                  "Apakah kamu ingin menghubungi pemilik kos?",
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Batal'),
                                      child: Text("Batal")),
                                  TextButton(
                                    onPressed: () => {
                                      launchUrl('tel : +6287781433687'),
                                    },
                                    child: Text("Hubungi"),
                                  )
                                ]),
                          ),
                          child: Text(
                            "Book Now",
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),

                      //   RaisedButton(
                      //     color: purpleColor,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(17)),
                      //     onPressed: () => {
                      //       launchUrl('tel : +6287781433687');
                      //     },
                      //     child: Text(
                      //       "Book Now",
                      //       style: whiteTextStyle.copyWith(fontSize: 18),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: edge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/btn_back.png",
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        print(isClicked);
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked
                          ? 'assets/btn_wishlist_active.png'
                          : 'assets/btn_wishlist.png',
                      width: 40,
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
}
