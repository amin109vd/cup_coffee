import 'package:cup_coffee/data/models/NearestCoffeeShopModel.dart';
import 'package:cup_coffee/data/repository/server_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nearest_coffee_shop_event.dart';

part 'nearest_coffee_shop_state.dart';

class NearestCoffeeShopBloc
    extends Bloc<NearestCoffeeShopEvent, NearestCoffeeShopState> {
  final IServerRepository repository;

  NearestCoffeeShopBloc(this.repository) : super(NearestCoffeeShopInitial()) {
    on<NearestCoffeeShopEvent>((event, emit) {});

    on<NearestCoffeeShopStarted>((event, emit) async {
      try {
        emit(NearestCoffeeShopLoading());
        await Future.delayed(const Duration(milliseconds: 3500));
        var response = await repository.getNearestCoffeeShop();
        emit(NearestCoffeeShopSuccess(response));
      } on DioError catch (e) {
        debugPrint(e.message);
        emit(NearestCoffeeShopFailure('error in connecting to server'));
      } catch (e) {
        debugPrint(e.toString());
        emit(NearestCoffeeShopFailure('something went wrong $e'));
      }
    });
  }
}
