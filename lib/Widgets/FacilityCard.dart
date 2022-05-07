import 'package:flutter/material.dart';

import '../theme.dart';

class FacilityCard extends StatelessWidget {
  final String imageUrl;
  final int total;
  final String name;

  FacilityCard(
      {required this.imageUrl, required this.total, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
              text: '$total ',
              style: purpleTextStyle.copyWith(fontSize: 14),
              children: [
                TextSpan(
                  text: name,
                  style: greyTextStyle.copyWith(fontSize: 14),
                ),
              ]),
        ),
      ],
    );
  }
}
