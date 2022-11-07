import 'package:cup_coffee/data/utils/m_extension.dart';
import 'package:flutter/material.dart';

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
          
        ],
      ),
    );
  }
}
