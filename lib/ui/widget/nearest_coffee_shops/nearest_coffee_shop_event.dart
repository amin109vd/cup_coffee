part of 'nearest_coffee_shop_bloc.dart';

abstract class NearestCoffeeShopEvent extends Equatable {
  const NearestCoffeeShopEvent();
}

class NearestCoffeeShopStarted extends NearestCoffeeShopEvent {
  @override
  List<Object?> get props => [];
}
