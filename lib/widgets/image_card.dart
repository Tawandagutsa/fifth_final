import 'package:flutter/material.dart';
import 'package:fifth/constants/colors.dart';
import '../utils/screen_utils.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;

  const ImageCard(
    this.imagePath, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset.zero,
              blurRadius: 15.0,
            )
          ],
          image: DecorationImage(
              image: AssetImage(this.imagePath), fit: BoxFit.cover)),
      child: Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Text(
              'This is the name',
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              'this is the other item ',
              style: TextStyle(
                color: kPrimaryGreen,
                fontSize: getProportionateScreenWidth(
                  12,
                ),
              ),
            ),
          ])),
    );
  }
}
