import 'package:flutter/material.dart';
import 'package:task_1/first_page/model.dart';
import 'package:task_1/first_page/repository.dart';

sealed class CoinsState {}

class CoinsLoadingState extends CoinsState {}

class CoinsDataState extends CoinsState {
  final List<Coin> coins;
  CoinsDataState(this.coins);
}

class CoinsErrorState extends CoinsState {
  final String message;
  CoinsErrorState(Object? message) : message = message.toString();
}

class CoinsNotifier extends ValueNotifier<CoinsState> {
  CoinsNotifier() : super(CoinsLoadingState());

  Future<void> init() async {
    try {
      final result = await _fetchCoins();
      value = CoinsDataState(result);
    } catch (e, s) {
      value = CoinsErrorState(e);
    }
  }

  Future<List<Coin>> _fetchCoins() async {
    return await ApiServices().getCoins();
  }

  Future<void> refresh() async {
    value = CoinsLoadingState();
    await init();
  }
}