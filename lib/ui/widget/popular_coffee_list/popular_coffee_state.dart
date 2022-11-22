part of 'popular_coffee_bloc.dart';

abstract class PopularCoffeeState extends Equatable {
  const PopularCoffeeState();
}

class PopularCoffeeInitial extends PopularCoffeeState {
  @override
  List<Object> get props => [];
}

class PopularCoffeeLoading extends PopularCoffeeState {
  @override
  List<Object> get props => [];
}

class PopularCoffeeFailure extends PopularCoffeeState {
  final String errorMessage;

  const PopularCoffeeFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class PopularCoffeeSuccess extends PopularCoffeeState {
  final List<PopularCoffeeModels> list;

  const PopularCoffeeSuccess(this.list);

  @override
  List<Object> get props => [list];
}
