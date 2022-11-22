import 'dart:convert';

import 'package:cup_coffee/data/models/PopularCoffeeModels.dart';
import 'package:cup_coffee/data/server/server_core.dart';

class ServerRepository {
  Future<List<PopularCoffeeModels>> getPopularListModels() async {
    var response = await getPopularCoffeeServer();
    List<PopularCoffeeModels> resList = [];
    for (var item in jsonDecode(response.data)) {
      resList.add(PopularCoffeeModels.fromJson(item));
    }
    return resList;
  }
}

ServerRepository serverRepository = ServerRepository();
