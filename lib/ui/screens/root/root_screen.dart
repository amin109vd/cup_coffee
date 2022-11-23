import 'package:cup_coffee/data/utils/m_extension.dart';
import 'package:cup_coffee/generated/assets.dart';
import 'package:cup_coffee/ui/screens/main/main_screen.dart';
import 'package:cup_coffee/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);
  static const String tag = '/RootScreenRoute';

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentBottomNavigation = 0;
  List<Widget> list=[
    MainScreen(),
    Container(color: Colors.green),
    Container(color: Colors.green),
    Container(color: Colors.green),
    Container(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentBottomNavigation],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() {
          _currentBottomNavigation = value;
        }),
        currentIndex: _currentBottomNavigation,
        enableFeedback: true,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        selectedItemColor: assetsColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.iconsHome,
                color: assetsColor,
              ),
              icon: SvgPicture.asset(Assets.iconsHome),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.iconsShoppingBag,
                color: assetsColor,
              ),
              icon: SvgPicture.asset(Assets.iconsShoppingBag),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.iconsMapPin,
                color: assetsColor,
              ),
              icon: SvgPicture.asset(Assets.iconsMapPin),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.iconsHeart,
                color: assetsColor,
              ),
              icon: SvgPicture.asset(Assets.iconsHeart),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.iconsUser,
                color: assetsColor,
              ),
              icon: SvgPicture.asset(Assets.iconsUser),
              label: ''),
        ],
      ),
    );
  }
}
