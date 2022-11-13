import 'package:cup_coffee/generated/assets.dart';
import 'package:cup_coffee/ui/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String tag = '/MainScreenRoute';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Get your ', style: theme.textTheme.headline1),
                    TextSpan(
                        text: 'Coffee \n',
                        style: theme.textTheme.headline1
                            ?.copyWith(color: primaryColor)),
                    TextSpan(
                        text: 'on one finger tap',
                        style: theme.textTheme.headline1),
                  ]),
                ),
                CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(Assets.imageMe),
                    radius: 28,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                hintMaxLines: 1,
                hintText: 'Search anything',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Popular Coffee',
              style: theme.textTheme.headline3,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}
