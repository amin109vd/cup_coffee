import 'package:cup_coffee/data/model/popular_coffee_model.dart';
import 'package:cup_coffee/data/utils/utils.dart';
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
  List<PopularCoffeeModel> _popularCoffeeList = [
    PopularCoffeeModel(
        title: 'Cappuccino',
        location: 'Coffee cafe',
        image: Assets.imageCoffee01,
        price: 550.0,
        deliveredTime: 10,
        rating: 5.0,
        details: lorem1P,
        onTap: () {}),
    PopularCoffeeModel(
        title: 'Chocolate coffee',
        location: 'Bunny cafe',
        image: Assets.imageCoffee02,
        price: 125.3,
        deliveredTime: 7,
        rating: 4.7,
        details: lorem1P,
        onTap: () {}),
    PopularCoffeeModel(
        title: 'Espresso ',
        location: 'Vintage cafe',
        image: Assets.imageCoffee03,
        price: 25.0,
        deliveredTime: 15,
        rating: 4.3,
        details: lorem1P,
        onTap: () {}),
    PopularCoffeeModel(
        title: 'Macchiato',
        location: 'Boof cafe',
        image: Assets.imageCoffee04,
        price: 369,
        deliveredTime: 10,
        rating: 4.1,
        details: lorem1P,
        onTap: () {}),
    PopularCoffeeModel(
        title: 'Ristretto',
        location: 'Roo cafe',
        image: Assets.imageCoffee05,
        price: 452.1,
        deliveredTime: 6,
        rating: 5.0,
        details: lorem1P,
        onTap: () {}),
    PopularCoffeeModel(
        title: 'Americano ',
        location: 'Coffee cafe',
        image: Assets.imageCoffee06,
        price: 357,
        deliveredTime: 10,
        rating: 4.1,
        details: lorem1P,
        onTap: () {}),
    PopularCoffeeModel(
        title: 'Caffè Latte',
        location: 'Coffee cafe',
        image: Assets.imageCoffee01,
        price: 147.25,
        deliveredTime: 10,
        rating: 4.9,
        details: lorem1P,
        onTap: () {}),
    PopularCoffeeModel(
        title: 'Flat White',
        location: 'Coffee cafe',
        image: Assets.imageCoffee01,
        price: 159.35,
        deliveredTime: 8,
        rating: 4.0,
        details: lorem1P,
        onTap: () {}),
  ];

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
            Container(
              height: 245,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ItemPopularCoffeeList(
                      coffeeModel: _popularCoffeeList[index]),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount: _popularCoffeeList.length),
            )
          ],
        ),
      ),
    );
  }
}

class ItemPopularCoffeeList extends StatelessWidget {
  const ItemPopularCoffeeList({Key? key, required this.coffeeModel})
      : super(key: key);
  final PopularCoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 261,
      height: 245,
      child: Column(
        children: [
          Container(
            width: 261,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(coffeeModel.image),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(10, 10),
                      blurRadius: 5,
                      spreadRadius: 1)
                ],
                borderRadius: BorderRadius.circular(30)),
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      icon: Icon(
                        CupertinoIcons.heart,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          size: 14,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${coffeeModel.deliveredTime} min delivery',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Colors.white),
                        )
                      ],
                    )),
                Positioned(
                    bottom: 10,
                    right: 15,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          coffeeModel.rating.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Colors.white),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  coffeeModel.title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  '\$${coffeeModel.price}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 12,
                  color: Colors.grey,
                ),
                Text(coffeeModel.location,
                    style: Theme.of(context).textTheme.caption)
              ],
            ),
          )
        ],
      ),
    );
  }
}
