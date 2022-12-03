import 'package:cup_coffee/ui/screens/coffee/coffee_screen.dart';
import 'package:cup_coffee/ui/screens/coffee_shop/coffee_shop_screen.dart';
import 'package:cup_coffee/ui/screens/main/main_screen.dart';
import 'package:cup_coffee/ui/screens/root/root_screen.dart';
import 'package:cup_coffee/ui/screens/splash/splash_screen.dart';
import 'package:cup_coffee/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cup Coffee ☕',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: primaryColor,
            primarySwatch: generateMaterialColorFromColor(primaryColor),
            fontFamily: GoogleFonts.poppins().fontFamily,
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              headline2: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              headline3: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              headline4: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              headline5: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              caption: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: textGray),
              subtitle1: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: textGray),
            ),
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
            )),
        initialRoute: RootScreen.tag,
        routes: {
          SplashScreen.tag: (context) => SplashScreen(),
          MainScreen.tag: (context) => MainScreen(),
          RootScreen.tag: (context) => RootScreen(),
          CoffeeScreen.tag: (context) => CoffeeScreen(),
          CoffeeShopScreen.tag: (context) => CoffeeShopScreen()
        });
  }
}
