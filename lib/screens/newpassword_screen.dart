import 'package:flutter/material.dart';
import 'package:fifth/utils/screen_utils.dart';
import '../widgets/customTextInput.dart';
import '../constants/colors.dart';

import './login_screen.dart';

class NewPwScreen extends StatelessWidget {
  static const routeName = "/newpassword";
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "New Password",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextInput(hintText: "New Password"),
                SizedBox(
                  height: 20,
                ),
                CustomTextInput(
                  hintText: "Confirm Password",
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Text("Next"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
