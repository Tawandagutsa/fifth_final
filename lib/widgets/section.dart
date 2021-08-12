import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const Section(
    this.title,
    this.children, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.0, height: 1),
              ),
              InkWell(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 1,
                        color: kPrimaryGreen,
                      ),
                    ),
                   
                  ],
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Wrap(
                spacing: 28.0,
                children: children,
              ),
            ),
          ),
        )
      ],
    );
  }
}
