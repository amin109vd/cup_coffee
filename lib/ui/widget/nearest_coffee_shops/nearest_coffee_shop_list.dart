import 'package:cup_coffee/ui/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NearestCoffeeShops extends StatefulWidget {
  const NearestCoffeeShops({Key? key}) : super(key: key);

  @override
  State<NearestCoffeeShops> createState() => _NearestCoffeeShopsState();
}

class _NearestCoffeeShopsState extends State<NearestCoffeeShops> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      height: 215,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 177,
                    height: 154,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                                    "https://cdn.motor1.com/images/mgl/3WW1j1/s3/2022-bmw-i7.jpg")
                                .image)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 73,
                            padding: const EdgeInsets.all(1.3),
                            height: 30,
                            decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.6),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15))),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 16,
                                ),
                                Text(
                                  "${2.4} Km",
                                  style: theme.textTheme.subtitle1
                                      ?.copyWith(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Asley coffee',
                    style: theme.textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 14,
                      ),
                      Text(
                        '${5.0}/ ${105}  ratings',
                        style: theme.textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: 3),
    );
  }
}
