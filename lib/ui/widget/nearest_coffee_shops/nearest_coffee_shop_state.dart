part of 'nearest_coffee_shop_bloc.dart';

abstract class NearestCoffeeShopState extends Equatable {
  const NearestCoffeeShopState();
}

class NearestCoffeeShopInitial extends NearestCoffeeShopState {
  @override
  List<Object> get props => [];
}

class NearestCoffeeShopLoading extends NearestCoffeeShopState {
  @override
  List<Object> get props => [];
}

class NearestCoffeeShopSuccess extends NearestCoffeeShopState {
  final List<NearestCoffeeShopModel> list;

  NearestCoffeeShopSuccess(this.list);

  @override
  List<Object> get props => [list];
}

class NearestCoffeeShopFailure extends NearestCoffeeShopState {
  final String message;

  NearestCoffeeShopFailure(this.message);

  @override
  List<Object> get props => [message];
}
