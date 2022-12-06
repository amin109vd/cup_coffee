import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key, required this.images}) : super(key: key);
  final List<String> images;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  var currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.30,
      width: size.width,
      child: PageView(
        physics: BouncingScrollPhysics(),
        children: List<Widget>.generate(widget.images.length,
                (index) => ImageSliderItem(imagesUrl: widget.images[index]))
            .toList(),
        onPageChanged: (value) {
          setState(() {
            currentIndexPage = value;
          });
        },
      ),
    );
  }
}

class ImageSliderItem extends StatelessWidget {
  const ImageSliderItem({Key? key, required this.imagesUrl}) : super(key: key);
  final String imagesUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: CachedNetworkImage(
              imageUrl:
                  'https://raw.githubusercontent.com/mes71/fakeApi/master/$imagesUrl',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 15,
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(CupertinoIcons.arrow_left)),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(CupertinoIcons.heart)),
              ],
            ))
      ],
    );
  }
}
