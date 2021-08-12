import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:fifth/constants/colors.dart';
import '../screens/onboarding1_screen.dart';
import '../utils/screen_utils.dart';

import 'package:fifth/screens/onboarding1_screen.dart';

class Introscreen extends StatelessWidget {
  static const routeName = "/landingScreen";

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
        body: SafeArea(
            child: Container(

                //filler component
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
          Image.asset(
            'assets/images/landing.png',
            fit: BoxFit.cover,
          ),
          IntroWidget()
        ]))));
  }
}

class IntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(
              20,
            )),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      'Welcome to QuickBite',
                      style: Theme.of(context).textTheme.headline2.copyWith(
                          color: kTextColor, fontWeight: FontWeight.bold),
                    )),
                Spacer()
              ]),
              Text(
                'Where you can place an order and food is delivered to your doorstep.',
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: kTextColorAccent,
                    ),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Onboarding1.routeName);
                  },
                  child: Text('Get Started')),
              Spacer()
            ])));
  }
}
