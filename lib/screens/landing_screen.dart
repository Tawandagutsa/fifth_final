import 'package:flutter/material.dart';
import 'dart:async';

//introduction screen
import 'package:fifth/screens/intro_screen.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = '/landingting';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<LandingScreen> {
  Timer _timer;

  @override
  void initState() {
    _timer = Timer(Duration(milliseconds: 10000), () {
      Navigator.of(context).pushReplacementNamed(Introscreen.routeName);
    });
    super.initState();
  }

  //to take a few minutes add delay and also remember to ad the logo and a gif that is animated

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF800000),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/QuickBite.png',
                ),
              ),
              Spacer()
            ],
          ),
        ));
  }
}
