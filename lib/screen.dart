import 'package:flutter/material.dart';
import 'package:task_1/List/itemList.dart';
import 'package:task_1/List/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          itemCount: coins.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemList(index: index);
          },
        ),
      ),
    );
  }
}
