import 'package:cup_coffee/data/utils/m_extension.dart';
import 'package:cup_coffee/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);
  static String tag = 'RootScreen'.rTag;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.green),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(Assets.iconsHome),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset(Assets.iconsShoppingBag),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset(Assets.iconsMapPin),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset(Assets.iconsHeart),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset(Assets.iconsUser),label: ''),
        ],
      ),
    );
  }
}
