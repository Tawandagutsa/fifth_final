import 'package:fifth/providers/auth.dart';
import 'package:fifth/providers/cart.dart';
import 'package:fifth/providers/pay.dart';
import 'package:fifth/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './providers/orders.dart';
import './screens/Orders_screen.dart';
import './screens/phoneNumber.dart';
import './screens/tab_screen.dart';
// import './screens/splash_screen.dart';

import 'package:fifth/screens/intro_screen.dart';
import 'package:fifth/screens/onboarding1_screen.dart';
import 'package:fifth/screens/login_screen.dart';
import 'package:fifth/screens/signup_screen.dart';
import 'package:fifth/screens/forgotpassword_screen.dart';
import 'package:fifth/screens/newpassword_screen.dart';
import 'package:fifth/screens/signup_screen1.dart';
import 'package:fifth/screens/landing_screen.dart';
import 'package:fifth/screens/sentOTPScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        // ignore: missing_required_param
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) => Products(auth.token,
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        // ignore: missing_required_param
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(auth.token, auth.userId,
              previousOrders == null ? [] : previousOrders.orders),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Pay(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
            PhoneNumber.routeName: (ctx) => PhoneNumber(),
            Introscreen.routeName: (context) => Introscreen(),
            Onboarding1.routeName: (context) => Onboarding1(),
            LandingScreen.routeName: (context) => LoginScreen(),
            SignupScreen.routeName: (context) => SignupScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
            SendOTPScreen.routeName: (context) => SendOTPScreen(),
            NewPwScreen.routeName: (context) => NewPwScreen(),
            SignupScreen1.routeName: (context) => SignupScreen1(),
            TabScreen.routeName: (context) => TabScreen(),
          },
        ),
      ),
    );
  }
}
