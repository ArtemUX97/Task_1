import 'package:flutter/material.dart';
import 'package:task_1/second_page/model.dart';
import 'package:task_1/second_page/repository.dart';

sealed class OptionsState {}

class OptionsLoadingState extends OptionsState {}

class OptionsDataState extends OptionsState {
  final List<Options> options;
  OptionsDataState(this.options);
}

class OptionsErrorState extends OptionsState {
  final String message;
  OptionsErrorState(Object? message) : message = message.toString();
}

class OptionsNotifier extends ValueNotifier<OptionsState> {
  OptionsNotifier() : super(OptionsLoadingState());

  Future<void> init() async {
    try {
      final result = await _fetchOption();
      value = OptionsDataState(result);
    } catch (e, s) {
      value = OptionsErrorState(e);
    }
  }

  Future<List<Options>> _fetchOption() async {
    return await ApiServicesSecond().getOptions();
  }

  Future<void> refresh() async {
    value = OptionsLoadingState();
    await init();
  }
}