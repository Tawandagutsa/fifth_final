import 'package:flutter/material.dart';

import 'package:fifth/utils/screen_utils.dart';
import '../constants/colors.dart';
import 'package:fifth/constants/colors.dart';
import '../widgets/customTextInput.dart';
import './sentOTPScreen.dart';

class ForgetPwScreen extends StatelessWidget {
  static const routeName = "/restpwScreen";
  @override
  Widget build(BuildContext context) {

    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
         
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 30,
              ),
              child: Column(
                children: [
                  Text(
                    "Reset Password",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.bold
                            ),
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 15),
                    child: Text(
                      "Please enter your email to recieve a link to create a new password via email",
                      textAlign: TextAlign.center,
                    ),
                  ),
                 

                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: CustomTextInput(hintText: "Email"),
                  ),
                 
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SendOTPScreen.routeName);
                      },
                      child: Text("Send"),
                    ),
                  ),
                  Spacer(),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
