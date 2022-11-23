import 'package:cup_coffee/data/models/PopularCoffeeModels.dart';
import 'package:cup_coffee/data/repository/server_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_coffee_event.dart';

part 'popular_coffee_state.dart';

class PopularCoffeeBloc extends Bloc<PopularCoffeeEvent, PopularCoffeeState> {
  final ServerRepository serverRepository;

  PopularCoffeeBloc({required this.serverRepository})
      : super(PopularCoffeeInitial()) {
    on<PopularCoffeeEvent>((event, emit) {});

    on<PopularCoffeeStarted>((event, emit) async {
      try {
        emit(PopularCoffeeLoading());
        List<PopularCoffeeModels> coffeeList =
            await serverRepository.getPopularCoffee();
        emit(PopularCoffeeSuccess(coffeeList));
      } on DioError catch (e) {
        emit(const PopularCoffeeFailure('error in connecting to server'));
      } catch (e) {
        emit(PopularCoffeeFailure('something went wrong $e'));
      }
    });
  }
}
