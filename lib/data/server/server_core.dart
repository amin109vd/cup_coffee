import 'package:dio/dio.dart';

Future<Response> getPopularCoffeeServer() async => await Dio().get(
    "https://raw.githubusercontent.com/mes71/fakeApi/master/Cup_Coffee/popular_coffee.json");
