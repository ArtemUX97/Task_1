import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_1/firstPage/screenFirst.dart';
import 'package:task_1/secondPage/screenSecond.dart';

import 'controller.dart';
import 'itemList.dart';

class ScreenFirst extends StatefulWidget {
  const ScreenFirst({super.key});

  @override
  State<ScreenFirst> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ScreenFirst> {

  @override
  Widget build(BuildContext context) {
    final coinsNotifier = Provider.of<CoinsNotifier>(context);
    final coinsState = coinsNotifier.value;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 247, 248, 1),
      body: switch (coinsState) {
          CoinsDataState(:final coins) => Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: coinsNotifier.refresh,
                    child: ListView.builder(
                      cacheExtent: 300,
                      itemCount: coins.length,
                      itemBuilder: (BuildContext context, int index) {
                        final coin = coins[index];
                        return ItemList(coin: coin);
                      },
                    ),
                  ),
                ),
              ],
            ),
          CoinsLoadingState() => const Center(child: CircularProgressIndicator()),
          CoinsErrorState() => const Center(child: Text('Error')),
        },
    );
  }
}
