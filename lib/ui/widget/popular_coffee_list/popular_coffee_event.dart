part of 'popular_coffee_bloc.dart';

abstract class PopularCoffeeEvent extends Equatable {
  const PopularCoffeeEvent();
}

class PopularCoffeeStarted extends PopularCoffeeEvent {
  @override
  List<Object?> get props => [];
}
