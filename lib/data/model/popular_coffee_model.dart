import 'dart:ui';

class PopularCoffeeModel {
  final String title;
  final String details;
  final String image;
  final String location;
  final double price;
  final int deliveredTime;
  final double rating;
  final VoidCallback onTap;

  PopularCoffeeModel({
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.deliveredTime,
    required this.rating,
    required this.details,
    required this.onTap,
  });
}
