import 'package:flutter/material.dart';
import 'package:task_1/List/itemList.dart';
import 'package:task_1/List/model.dart';
import 'List/repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CoinsModel coins = CoinsModel(clients: []);

  @override
  void initState() {
    super.initState();

    ApiServices().getCoinsModel().then(
          (value) => setState(() => coins = value ?? coins),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 247, 248, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(246, 247, 248, 1),
        ),
        child: ListView.builder(
          cacheExtent: 300,
          itemCount: coins.clients.length,
          itemBuilder: (BuildContext context, int index) {
            final client = coins.clients[index];
            return ItemList(client: client);
          },
        ),
      ),
    );
  }
}
