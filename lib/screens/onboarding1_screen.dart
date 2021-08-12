import 'package:flutter/material.dart';
import 'package:fifth/constants/colors.dart';
import 'package:fifth/screens/login_screen.dart';
import 'package:fifth/utils/screen_utils.dart';

// remembwe to also work on makeingthe text drageable as well
class Onboarding1 extends StatefulWidget {
  static const routeName = "/onboarding1";

  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  int pageCount = 0;

  final PageController _controller = PageController();

  void setPageCount(int aPageCount) {
    setState(() {
      pageCount = aPageCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Illustrationpageview(_controller, setPageCount),
            Textview(pageCount)
          ],
        ),
      ),
    );
  }
}

class Textview extends StatelessWidget {
  final int pageCount;

  const Textview(this.pageCount);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'title': 'Order and Pick Up Later',
        'desc': 'You can place and order and schedule a time to pick it up. '
      },
      {
        'title': 'Delivery',
        'desc':
            'Just place an order and your food will be delivered to your location. .'
      },
      {
        'title': 'Promotions',
        'desc':
            'Check your notifications for any promotions. You might get lucky.'
      },
    ];
    return Expanded(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                data[pageCount]['title'],
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              data[pageCount]['desc'],
              textAlign: TextAlign.center,
              style: TextStyle(color: kTextColorAccent),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageIndicator(pageCount, 0),
                SizedBox(
                  width: getProportionateScreenWidth(4),
                ),
                PageIndicator(pageCount, 1),
                SizedBox(
                  width: getProportionateScreenWidth(4),
                ),
                PageIndicator(pageCount, 2),
              ],
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: Text('Get Started')),
            Spacer()
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator(this.pageCount, this.index);

  final int pageCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        microseconds: 3000,
      ),
      width: pageCount == index
          ? getProportionateScreenWidth(32)
          : getProportionateScreenWidth(8),
      height: getProportionateScreenWidth(8),
      decoration: BoxDecoration(
          color: pageCount == index ? kPrimaryGreen : kFillColorPrimary,
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(4))),
    );
  }
}

class Illustrationpageview extends StatelessWidget {
  final controller;
  final Function(int) callable;

  const Illustrationpageview(this.controller, this.callable);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: kTextColor,
                        ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
              ],
            ),
            //for the logo file firt
            Padding(
              padding: const EdgeInsets.only(
                bottom: 50,
                top: 18,
              ),
              child: Image.asset(
                'assets/images/QuickBite2.png',
                scale: 1.5,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: SizedBox(
                height: 200,
                child: PageView(
                    controller: controller,
                    onPageChanged: (pageNum) {
                      callable(pageNum);
                    },
                    children: [
                      Image.asset('assets/images/038-take-away.png',
                          scale: 2.7),
                      Image.asset('assets/images/031-delivery.png', scale: 2.7),
                      Image.asset('assets/images/023-coupon.png', scale: 2.7),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
