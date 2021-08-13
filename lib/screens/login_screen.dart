import 'package:flutter/material.dart';
import 'package:fifth/constants/colors.dart';
import 'package:fifth/utils/screen_utils.dart';
import '../widgets/customTextInput.dart';
import '../screens/signup_screen.dart';
import '../screens/forgotpassword_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';
import './products_overview_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fifth/screens/products_overview_screen.dart';
import '../screens/tab_screen.dart';
import '../models/http_exception.dart';

enum AuthMode { Signup, Login }

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _myEmailcontroller = TextEditingController();
  final _myPasswordcontroller = TextEditingController();
  var _isLoading = false;

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occured'),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text('Okay'),
                ),
              ],
            ));
  }

  // @override
  // void dispose() {
  //   _myEmailcontroller.dispose();
  //   _myPasswordcontroller.dispose();
  //   super.dispose();
  // }

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
                    "Login",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: kTextColor, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text('Add your details to login'),
                  Spacer(),
                  CustomTextInput(
                    hintText: "Your email",
                    controller: _myEmailcontroller,
                    onSaved: (value) {
                      _authData['email'] = _myEmailcontroller.text;
                    },
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                    },
                  ),
                  Spacer(),
                  CustomTextInput(
                    hintText: "password",
                    controller: _myPasswordcontroller,
                    onSaved: (value) {
                      _authData['password'] = _myPasswordcontroller.text;
                    },
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Password is too short!';
                      }
                    },
                  ),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await Provider.of<Auth>(context, listen: false).login(
                            _myEmailcontroller.text,
                            _myPasswordcontroller.text,
                          );
                          Navigator.of(context).pushNamed(TabScreen.routeName);
                        } on HttpException catch (error) {
                          var errorMessage = "Authentication failed.";
                          if (error.toString().contains("EMAIL_EXISTS")) {
                            errorMessage = "This email is already in use.";
                          } else if (error
                              .toString()
                              .contains("INVALID_EMAIL")) {
                            errorMessage = "This is not a valid email address.";
                          } else if (error
                              .toString()
                              .contains("WEAK_PASSWORD")) {
                            errorMessage = "This password is too weak.";
                          } else if (error
                              .toString()
                              .contains("EMAIL_NOT_FOUND")) {
                            errorMessage = "No user found with this email.";
                          } else if (error
                              .toString()
                              .contains("INVALID_PASSWORD")) {
                            errorMessage = "Invalid password.";
                          }
                          _showErrorDialog(errorMessage);
                        } catch (error) {
                          var errorMessage =
                              "Could not Authenticate you. Please check your internet connection.";
                          _showErrorDialog(errorMessage);
                          print(errorMessage);
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      child: Text(
                        "Login",
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(ForgetPwScreen.routeName);
                    },
                    child: Text("Forget your password?"),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text("or Login With"),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(
                            0xFF367FC0,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/fb.png'),
                          SizedBox(
                            width: 30,
                          ),
                          Text("Login with Facebook")
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(
                            0xFFDD4B39,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        await Provider.of<Auth>(context, listen: false)
                            .googleSignIn()
                            .then((_) => {
                                  Navigator.of(context)
                                      .pushNamed(TabScreen.routeName)
                                });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/google.png'),
                          SizedBox(
                            width: 30,
                          ),
                          Text("Login with Google")
                        ],
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignupScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an Account?"),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: kPrimaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
