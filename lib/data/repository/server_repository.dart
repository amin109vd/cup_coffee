import 'package:cup_coffee/data/models/NearestCoffeeShopModel.dart';
import 'package:cup_coffee/data/models/PopularCoffeeModels.dart';
import 'package:cup_coffee/data/source/server_data_source.dart';

abstract class IServerRepository {
  Future<List<PopularCoffeeModels>> getPopularCoffee();

  Future<List<NearestCoffeeShopModel>> getNearestCoffeeShop();
}

class ServerRepository extends IServerRepository {
  final IServerDataSource dataSource;

  ServerRepository(this.dataSource);

  @override
  Future<List<NearestCoffeeShopModel>> getNearestCoffeeShop() async =>
      await dataSource.getNearestCoffeeShopDataSource();

  @override
  Future<List<PopularCoffeeModels>> getPopularCoffee() async =>
      await dataSource.getPopularCoffeeDataSource();
}

ServerRepository serverRepository = ServerRepository(ServerDataSource());
