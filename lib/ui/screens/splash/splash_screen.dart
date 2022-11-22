import 'package:cup_coffee/data/utils/m_extension.dart';
import 'package:cup_coffee/generated/assets.dart';
import 'package:cup_coffee/ui/screens/root/root_screen.dart';
import 'package:cup_coffee/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String tag = 'SplashScreen'.rTag;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //For delay in splash Screen
    // Timer(const Duration(milliseconds: 2500), () {
    //   Navigator.pushReplacementNamed(context, RootScreen.tag);
    // });
    Future.delayed(Duration(milliseconds: 2500),
    () => Navigator.pushReplacementNamed(context, RootScreen.tag));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imageSplash), fit: BoxFit.cover)),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Cup',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    12.toWidth,
                    Text(
                      'Coffee',
                      style: TextStyle(color: primaryColor, fontSize: 50),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
