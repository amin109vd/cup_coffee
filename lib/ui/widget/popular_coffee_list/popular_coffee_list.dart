import 'package:cup_coffee/data/models/PopularCoffeeModels.dart';
import 'package:cup_coffee/data/utils/m_extension.dart';
import 'package:cup_coffee/ui/widget/popular_coffee_list/popular_coffee_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularCoffeeList extends StatefulWidget {
  const PopularCoffeeList({Key? key}) : super(key: key);

  @override
  State<PopularCoffeeList> createState() => _PopularCoffeeListState();
}

class _PopularCoffeeListState extends State<PopularCoffeeList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCoffeeBloc, PopularCoffeeState>(
      builder: (context, state) {
        return SizedBox(
          height: 245,
          child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => state is PopularCoffeeSuccess
                  ? ItemPopularCoffeeList(coffeeModel: state.list[index])
                  : const ItemShimmerPopularCoffeeList(),
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: state is PopularCoffeeSuccess ? state.list.length : 5),
        );
      },
    );
  }
}

class ItemPopularCoffeeList extends StatelessWidget {
  const ItemPopularCoffeeList({Key? key, required this.coffeeModel})
      : super(key: key);
  final PopularCoffeeModels coffeeModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 261,
      height: 245,
      child: Column(
        children: [
          Container(
            width: 261,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(coffeeModel.images![0].pictureGitHubPath),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(10, 10),
                      blurRadius: 10,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(30)),
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      icon: const Icon(
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
                        const Icon(
                          Icons.access_time_outlined,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${coffeeModel.deliveredTime} min to delivery',
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
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.amber,
                        ),
                        const SizedBox(
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
                  coffeeModel.title!,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  '\$${coffeeModel.price?.values.first}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 12,
                  color: Colors.grey,
                ),
                Text(coffeeModel.location!,
                    style: Theme.of(context).textTheme.caption)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemShimmerPopularCoffeeList extends StatelessWidget {
  const ItemShimmerPopularCoffeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 261,
      height: 245,
      child: Column(
        children: [
          Container(
            width: 261,
            height: 180,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(30)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 261,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 261,
            height: 18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: Colors.grey),
          )
        ],
      ),
    );
  }
}
