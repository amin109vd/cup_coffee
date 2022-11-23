import 'package:cup_coffee/data/repository/server_repository.dart';
import 'package:cup_coffee/generated/assets.dart';
import 'package:cup_coffee/ui/utils/colors.dart';
import 'package:cup_coffee/ui/widget/nearest_coffee_shops/nearest_coffee_shop_list.dart';
import 'package:cup_coffee/ui/widget/popular_coffee_list/popular_coffee_bloc.dart';
import 'package:cup_coffee/ui/widget/popular_coffee_list/popular_coffee_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            var bloc = PopularCoffeeBloc(serverRepository: serverRepository);
            bloc.add(PopularCoffeeStarted());
            return bloc;
          },
        )
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
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
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(Assets.imageMe),
                      radius: 28,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                        ),
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: Colors.grey,
                        ),
                        hintMaxLines: 1,
                        hintText: 'Search anything',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Popular Coffee',
                      style: theme.textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const PopularCoffeeList(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nearest coffee shops',
                          style: theme.textTheme.headline3,
                        ),
                        Text(
                          'View all',
                          style: theme.textTheme.subtitle1
                              ?.copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              const NearestCoffeeShops()
            ],
          ),
        ),
      ),
    );
  }
}
