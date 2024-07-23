import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
import 'item_list.dart';

final logger = Logger();

class ScreenSecond extends StatefulWidget {
  const ScreenSecond({super.key});

  @override
  State<ScreenSecond> createState() => _ScreenSecondState();
}

class _ScreenSecondState extends State<ScreenSecond> {
  @override
  Widget build(BuildContext context) {
    final optionsNotifier = Provider.of<OptionsNotifier>(context);
    final optionsState = optionsNotifier.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ScreenSecond"),
      ),
      body: switch (optionsState) {
        OptionsDataState(:final options) => Column(
            children: [
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
