/// id : 1
/// title : "Coffee Lab"
/// images : ["Cup_Coffee/assets/images/coffee_shop_01.png","Cup_Coffee/assets/images/coffee_shop_02.png","Cup_Coffee/assets/images/coffee_shop_03.png"]
/// rating : 4.6
/// rating_count : 262
/// description : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
/// distance : 0.8
/// latitude : 52.512642076728625
/// longitude  : 13.411307471096057

class NearestCoffeeShopModel {
  NearestCoffeeShopModel({
      num? id, 
      String? title, 
      List<String>? images, 
      num? rating, 
      num? ratingCount, 
      String? description, 
      num? distance, 
      num? latitude, 
      num? longitude,}){
    _id = id;
    _title = title;
    _images = images;
    _rating = rating;
    _ratingCount = ratingCount;
    _description = description;
    _distance = distance;
    _latitude = latitude;
    _longitude = longitude;
}

  NearestCoffeeShopModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _rating = json['rating'];
    _ratingCount = json['rating_count'];
    _description = json['description'];
    _distance = json['distance'];
    _latitude = json['latitude'];
    _longitude = json['longitude '];
  }
  num? _id;
  String? _title;
  List<String>? _images;
  num? _rating;
  num? _ratingCount;
  String? _description;
  num? _distance;
  num? _latitude;
  num? _longitude;
NearestCoffeeShopModel copyWith({  num? id,
  String? title,
  List<String>? images,
  num? rating,
  num? ratingCount,
  String? description,
  num? distance,
  num? latitude,
  num? longitude,
}) => NearestCoffeeShopModel(  id: id ?? _id,
  title: title ?? _title,
  images: images ?? _images,
  rating: rating ?? _rating,
  ratingCount: ratingCount ?? _ratingCount,
  description: description ?? _description,
  distance: distance ?? _distance,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
);
  num? get id => _id;
  String? get title => _title;
  List<String>? get images => _images;
  num? get rating => _rating;
  num? get ratingCount => _ratingCount;
  String? get description => _description;
  num? get distance => _distance;
  num? get latitude => _latitude;
  num? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['images'] = _images;
    map['rating'] = _rating;
    map['rating_count'] = _ratingCount;
    map['description'] = _description;
    map['distance'] = _distance;
    map['latitude'] = _latitude;
    map['longitude '] = _longitude;
    return map;
  }

}