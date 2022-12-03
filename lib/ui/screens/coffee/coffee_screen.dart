import 'package:cup_coffee/data/models/PopularCoffeeModels.dart';
import 'package:cup_coffee/ui/widget/image_slider/image_slider.dart';
import 'package:flutter/material.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({Key? key}) : super(key: key);
  static const String tag = "/CoffeeScreenRoute";

  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  @override
  Widget build(BuildContext context) {
    final PopularCoffeeModels model =
        ModalRoute.of(context)!.settings.arguments as PopularCoffeeModels;
    print(model.toString());
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.title!,
          style: textTheme.headline6,
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [ImageSlider(images: model.images!)],
      ),
    );
  }
}
