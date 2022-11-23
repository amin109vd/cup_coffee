import 'dart:convert';

/// id : 1
/// title : "cappuccino"
/// images : ["Cup_Coffee/assets/images/cappo_01.png","Cup_Coffee/assets/images/cappo_02.png"]
/// rating : 4.9
/// price : {"100":5.36,"120":7.12,"170":8.06}
/// description : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
/// ingredients : ["Coffee","Milk","Milk Foam"]
/// deliveredTime : 10
/// location: donatCafe

class PopularCoffeeModels {
  PopularCoffeeModels({
    num? id,
    num? deliveredTime,
    String? title,
    List<String>? images,
    num? rating,
    Map<String, dynamic>? price,
    String? description,
    String? location,
    List<String>? ingredients,
  }) {
    _id = id;
    _title = title;
    _images = images;
    _rating = rating;
    _price = price;
    _description = description;
    _ingredients = ingredients;
    _deliveredTime = deliveredTime;
    _location = location;
  }

  PopularCoffeeModels.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _rating = json['rating'];
    _price = json['price'] ?? [];
    _description = json['description'];
    _ingredients =
        json['ingredients'] != null ? json['ingredients'].cast<String>() : [];
    _deliveredTime = json['deliveredTime'];
    _location = json['location'];
  }

  num? _id;
  num? _deliveredTime;
  String? _title;
  String? _location;
  List<String>? _images;
  num? _rating;
  Map<String,dynamic>? _price;
  String? _description;
  List<String>? _ingredients;

  PopularCoffeeModels copyWith(
          {num? id,
          String? title,
          List<String>? images,
          num? rating,
          Map<String, dynamic>? price,
          String? description,
          String? location,
          List<String>? ingredients,
          num? deliveredTime}) =>
      PopularCoffeeModels(
          id: id ?? _id,
          title: title ?? _title,
          images: images ?? _images,
          rating: rating ?? _rating,
          price: price ?? _price,
          description: description ?? _description,
          ingredients: ingredients ?? _ingredients,
          deliveredTime: deliveredTime ?? _deliveredTime,
          location: location ?? _location);

  num? get id => _id;

  String? get title => _title;

  List<String>? get images => _images;

  num? get rating => _rating;

  Map<String, dynamic>? get price => _price;

  String? get description => _description;

  List<String>? get ingredients => _ingredients;

  num? get deliveredTime => _deliveredTime;

  String? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['images'] = _images;
    map['rating'] = _rating;
    if (_price != null) {
      map['price'] = jsonEncode(_price);
    }
    map['description'] = _description;
    map['ingredients'] = _ingredients;
    map['deliveredTime'] = _deliveredTime;
    map['location'] = _location;
    return map;
  }
}
