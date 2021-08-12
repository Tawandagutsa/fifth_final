import 'package:flutter/material.dart';
import 'package:fifth/screens/tab_screen.dart';
import 'package:fifth/utils/screen_utils.dart';
import '../widgets/customTextInput.dart';
import '../constants/colors.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

import './login_screen.dart';

import 'package:flutter/cupertino.dart';
//Rememebr to make the fonts of the steps way smaller

class SignupScreen extends StatelessWidget {
  static const routeName = "/signup";
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'firstname': '',
    'lastname': '',
    'phoneNumber': ''
  };

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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                  ],
                ),
                Text(
                  "Please enter your Firstname and Lastname",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CustomTextInput(
                  hintText: "Enter your Firstname",
                  controller: _firstName,
                  onSaved: (_) => {
                    _authData['firstname'] = _firstName.text,
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CustomTextInput(
                  hintText: "Enter your Lastname",
                  controller: _lastName,
                  onSaved: (_) => {
                    _authData['lastname'] = _lastName.text,
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CustomTextInput(
                  hintText: "Enter your Email Address",
                  controller: _email,
                  onSaved: (_) => {
                    _authData['email'] = _email.text,
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CustomTextInput(
                  hintText: "Enter your Phone Number",
                  controller: _phoneNumber,
                  onSaved: (_) => {
                    _authData['phoneNumber'] = _phoneNumber.text,
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CustomTextInput(
                  hintText: "Create Password",
                  controller: _password,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CustomTextInput(
                  hintText: "Confirm Password",
                  controller: _confirmPassword,
                  validator: (value) {
                    if (value != _password) {
                      return 'Passwords do not match!';
                    }
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Provider.of<Auth>(context, listen: false).signup(
                          _email.text,
                          _firstName.text,
                          _lastName.text,
                          _password.text,
                          _phoneNumber.text);
                      print(_email.text);
                      Navigator.of(context)
                          .pushReplacementNamed(TabScreen.routeName);
                    },
                    child: Text("Next"),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
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
