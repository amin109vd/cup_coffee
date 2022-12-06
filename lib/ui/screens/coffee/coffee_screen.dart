import 'package:cup_coffee/data/models/PopularCoffeeModels.dart';
import 'package:cup_coffee/data/utils/m_extension.dart';
import 'package:cup_coffee/ui/utils/colors.dart';
import 'package:cup_coffee/ui/widget/image_slider/image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({Key? key}) : super(key: key);
  static const String tag = "/CoffeeScreenRoute";

  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  bool isReadMoreCilcked = false;
  int? chipsSelected;
  int productCount = 1;

  @override
  Widget build(BuildContext context) {
    final PopularCoffeeModels model =
        ModalRoute.of(context)!.settings.arguments as PopularCoffeeModels;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ImageSlider(images: model.images!),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.title!,
                    style: textTheme.headline4,
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.amber,
                        size: 18,
                      ),
                      2.toWidth,
                      Text(
                        model.rating.toString(),
                        style: textTheme.headline6,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  Text(
                    '(\$${model.price!.values.first})',
                    style: textTheme.subtitle1!.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildText(model.description!, isReadMoreCilcked),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isReadMoreCilcked = !isReadMoreCilcked;
                        });
                      },
                      child:
                          Text(isReadMoreCilcked ? 'Less Text' : 'Read More'))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Wrap(
                runSpacing: 15,
                spacing: 30,
                children: List.generate(
                    model.ingredients!.length,
                    (index) =>
                        buildIntegrationItems(model.ingredients![index])),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Choose size',
                        style: textTheme.headline3,
                      ),
                    ],
                  ),
                  10.toHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        model.price!.length,
                        (index) => ChoiceChip(
                              label: SizedBox(
                                width: 53,
                                height: 27,
                                child: Center(
                                  child: Text(
                                    model.price!.keys.toList()[index],
                                  ),
                                ),
                              ),
                              selectedColor: assetsColor,
                              backgroundColor: Colors.white,
                              elevation: 0,
                              labelStyle: chipsSelected == index
                                  ? textTheme.subtitle1!
                                      .copyWith(color: Colors.white)
                                  : textTheme.subtitle1!
                                      .copyWith(color: assetsColor),
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: assetsColor, width: 2),
                                  borderRadius: BorderRadius.circular(9)),
                              onSelected: (value) {
                                setState(() {
                                  chipsSelected = value ? index : null;
                                });
                              },
                              selected: chipsSelected == index,
                            )),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 21),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor.withOpacity(0.2)),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    if (productCount > 1) {
                                      setState(() {
                                        productCount--;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    CupertinoIcons.minus,
                                    color: primaryColor,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              productCount.toString(),
                              style: textTheme.headline5!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      productCount++;
                                    });
                                  },
                                  icon: Icon(
                                    CupertinoIcons.plus,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180, 58),
                            backgroundColor: assetsColor,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Add to cart',
                            style: textTheme.headline5!
                                .copyWith(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildText(String text, bool isReadMoreMode) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1,
      maxLines: isReadMoreMode ? null : 3,
      overflow: isReadMoreMode ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }

  Widget buildIntegrationItems(String item) {
    IconData iconUrl;

    if (item.contains('coffee') || item.contains('Espresso')) {
      iconUrl = Icons.coffee;
    } else if (item.contains('cream') ||
        item.contains('foam') ||
        item.contains('syrup')) {
      iconUrl = Icons.icecream;
    } else {
      iconUrl = Icons.coffee_maker_rounded;
    }

    return Container(
      width: 73,
      height: 73,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor.withOpacity(0.2)),
      child: Center(
        child: Icon(
          iconUrl,
          color: primaryColor,
        ),
      ),
    );
  }
}
