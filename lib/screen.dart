import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'List/itemList.dart';
import 'List/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // CoinsModel coins = CoinsModel(clients: []);
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   ApiServices().getCoinsModel().then(
  //         (value) => setState(() => coins = value ?? coins),
  //       );
  // }
  Future _refresh() {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final coinsNotifier = Provider.of<CoinsNotifier>(context);
    final coins = coinsNotifier.clients;
    // var isLoaded = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 247, 248, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(246, 247, 248, 1),
        ),
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  cacheExtent: 300,
                  itemCount: coins.length,
                  itemBuilder: (BuildContext context, int index) {
                    final client = coins[index];
                    return ItemList(clients: client);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
