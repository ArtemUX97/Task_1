import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
import 'item_list.dart';

final logger = Logger();

class ScreenSecond extends StatefulWidget {
  ScreenSecond({super.key}) {
    // todo(18.07.2024): посмотреть в консоль, принять и понять, и убрать
    print('create ScreenSecond');
  }

  @override
  State<ScreenSecond> createState() => _ScreenSecondState();
}

class _ScreenSecondState extends State<ScreenSecond> {
  @override
  Widget build(BuildContext context) {
    final optionsNotifier = Provider.of<OptionsNotifier>(context);
    final optionsState = optionsNotifier.value;

    print('ScreenSecond build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("ScreenSecond"),
      ),
      body: switch (optionsState) {
        OptionsDataState(:final options) => options.isEmpty
            ? const Center(
                child: Text('Нет данных'),
              )
            : Column(
                children: [
                  if (options.isEmpty)
                    const Center(
                      child: Text('Нет данных'),
                    ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: optionsNotifier.refresh,
                      child: ListView.builder(
                        cacheExtent: 300,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final option = options[index];
                          // logger.d('Option $index: ${option.toJson()}');
                          return ItemListSecond(options: option);
                        },
                      ),
                    ),
                  ),
                ],
              ),
        OptionsLoadingState() =>
          const Center(child: CircularProgressIndicator()),
        OptionsErrorState() => const Center(child: Text('Error')),
      },
    );
  }
}
