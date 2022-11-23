import 'package:cup_coffee/data/utils/m_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  ShimmerList({Key? key, this.height = 215}) : super(key: key);
  double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: (height!-20),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      padding: index == 0 || index == 3
                          ? EdgeInsets.only(
                              left: index == 0 ? 20 : 0,
                              right: index == 3 ? 20 : 0)
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
                          7.toHeight,
                          Container(
                            height: 5,
                            color: Colors.grey,
                            child: Row(),
                          ),
                          2.toHeight,
                          Container(
                            height: 5,
                            color: Colors.grey,
                            child: Row(),
                          )
                        ],
                      ),
                    ),
                itemCount: 5),
          ),
        ));
  }
}
