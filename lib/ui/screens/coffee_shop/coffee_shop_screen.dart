import 'dart:async';

import 'package:cup_coffee/data/models/NearestCoffeeShopModel.dart';
import 'package:cup_coffee/data/utils/m_extension.dart';
import 'package:cup_coffee/ui/widget/image_slider/image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoffeeShopScreen extends StatefulWidget {
  const CoffeeShopScreen({Key? key}) : super(key: key);
  static const String tag = "/CoffeeShopScreenRoute";

  @override
  State<CoffeeShopScreen> createState() => _CoffeeShopScreenState();
}

class _CoffeeShopScreenState extends State<CoffeeShopScreen> {
  bool isReadMoreClicked = false;
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final NearestCoffeeShopModel model =
        ModalRoute.of(context)!.settings.arguments as NearestCoffeeShopModel;
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
                        '${model.rating}/ ${model.ratingCount} ratings',
                        style: textTheme.headline6,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(model.description!, isReadMoreClicked),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isReadMoreClicked = !isReadMoreClicked;
                        });
                      },
                      child:
                          Text(isReadMoreClicked ? 'Less Text' : 'Read More'))
                ],
              ),
            ),
            Expanded(
                child: Container(
              height: 350,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.all(16),
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: LatLng(model.latitude!.toDouble(),
                        model.longitude!.toDouble()),
                    zoom: 20),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
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
}
