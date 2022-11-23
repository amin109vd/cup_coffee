import 'dart:convert';

import 'package:cup_coffee/data/models/NearestCoffeeShopModel.dart';
import 'package:cup_coffee/data/models/PopularCoffeeModels.dart';
import 'package:cup_coffee/data/server/server_core.dart';

abstract class IServerDataSource {
  Future<List<PopularCoffeeModels>> getPopularCoffeeDataSource();

  Future<List<NearestCoffeeShopModel>> getNearestCoffeeShopDataSource();
}

class ServerDataSource extends IServerDataSource {
  @override
  Future<List<PopularCoffeeModels>> getPopularCoffeeDataSource() async {
    var response = await getPopularCoffeeServer();
    List<PopularCoffeeModels> resList = [];
    for (var item in jsonDecode(response.data)) {
      resList.add(PopularCoffeeModels.fromJson(item));
    }
    return resList;
  }

  @override
  Future<List<NearestCoffeeShopModel>> getNearestCoffeeShopDataSource() async {
    var response = await getNearestCoffeeShopServer();
    List<NearestCoffeeShopModel> resList = [];
    for (var item in jsonDecode(response.data)) {
      resList.add(NearestCoffeeShopModel.fromJson(item));
    }
    return resList;
  }
}

ServerDataSource serverDataSource = ServerDataSource();
