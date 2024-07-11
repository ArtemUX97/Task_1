import 'package:flutter/material.dart';
import 'package:task_1/List/model.dart';
import 'package:task_1/List/repository.dart';

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

/// Todo(artemizaak):
/// - детально просмотреть, как шаг за шагом работают все вызовы. Это можно узнать
/// с помощью логирования (log или print)
/// - немного освоить графический git в AS

/// todo(artemizaak, 11.07.2024):
/// - внедрить пагинацию (посмотри также, что такое моковые данные, чтобы не
/// получить запрет от сервера на количество запросов)
/// - выбрать любой другой апи с сайта, получить и отобразить данные на новой странице
/// - улучшить отображение значения стоимости, когда экран узок
/// - добавить текстовый заголовок в Appbar
