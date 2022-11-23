import 'package:cup_coffee/data/models/NearestCoffeeShopModel.dart';
import 'package:cup_coffee/data/utils/m_extension.dart';
import 'package:cup_coffee/ui/utils/colors.dart';
import 'package:cup_coffee/ui/widget/nearest_coffee_shops/nearest_coffee_shop_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class NearestCoffeeShops extends StatefulWidget {
  const NearestCoffeeShops({Key? key}) : super(key: key);

  @override
  State<NearestCoffeeShops> createState() => _NearestCoffeeShopsState();
}

class _NearestCoffeeShopsState extends State<NearestCoffeeShops> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NearestCoffeeShopBloc, NearestCoffeeShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NearestCoffeeShopLoading ||
            state is NearestCoffeeShopInitial) {
          return SizedBox(
            height: 215,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: const NearestCoffeeShopShimmer(),
            ),
          );
        } else if (state is NearestCoffeeShopSuccess) {
          return NearestCoffeeShopList(list: state.list);
        } else {
          return SizedBox(
            height: 216,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45),
                  elevation: 0,
                ),
                child: const Text('Try Aging'),
                onPressed: () {},
              ),
            ),
          );
        }
      },
    );
  }
}

class NearestCoffeeShopShimmer extends StatelessWidget {
  const NearestCoffeeShopShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
              padding: index == 0 || index == 3
                  ? EdgeInsets.only(
                      left: index == 0 ? 20 : 0, right: index == 3 ? 20 : 0)
                  : const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 177,
                    height: 154,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                    child: Row(),
                    height: 5,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    child: Row(),
                    height: 5,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
        itemCount: 5);
  }
}

class NearestCoffeeShopList extends StatefulWidget {
  const NearestCoffeeShopList({Key? key, required this.list}) : super(key: key);
  final List<NearestCoffeeShopModel> list;

  @override
  State<NearestCoffeeShopList> createState() => _NearestCoffeeShopListState();
}

class _NearestCoffeeShopListState extends State<NearestCoffeeShopList> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 222,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: index == 2
                    ? const EdgeInsets.symmetric(horizontal: 20)
                    : const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 230,
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(widget
                                      .list[index].images![0].pictureGitHubPath)
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
                                    "${widget.list[index].distance} Km",
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
                      widget.list[index].title!,
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
                          '${widget.list[index].rating}/ ${widget.list[index].ratingCount}  ratings',
                          style: theme.textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          itemCount: 3),
    );
  }
}
