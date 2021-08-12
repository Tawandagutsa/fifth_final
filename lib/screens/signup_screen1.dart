import 'package:flutter/material.dart';
import 'package:fifth/utils/screen_utils.dart';
import '../widgets/customTextInput.dart';
import '../constants/colors.dart';

import './login_screen.dart';

import 'package:flutter/cupertino.dart';
//Rememebr to make the fonts of the steps way smaller

class SignupScreen1 extends StatelessWidget {
  static const routeName = "/signup1";

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
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Step 2 of 4',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: kTextColor,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                  ],
                ),
                Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextInput(hintText: "Enter your Firstname"),
                SizedBox(
                  height: 20,
                ),
                CustomTextInput(
                  hintText: "Enter your Lastname",
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
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: kPrimaryGreen,
                              ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
