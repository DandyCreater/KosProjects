import 'package:flutter/material.dart';
import 'package:learningkos/theme.dart';

class BottomNavBarItem extends StatelessWidget {
  // const BottomNavBarItem({Key? key}) : super(key: key);
  final String ImageUrl;
  final bool isActived;

  BottomNavBarItem({required this.ImageUrl, required this.isActived});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          ImageUrl,
          width: 26,
        ),
        Spacer(),
        isActived
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(1000)),
                  color: purpleColor,
                ),
              )
            : Container(),
      ],
    );
  }
}
