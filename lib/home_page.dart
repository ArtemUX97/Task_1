import 'package:flutter/material.dart';
import 'package:task_1/firstPage/repository.dart';
import 'package:task_1/secondPage/screen_second.dart';

import 'firstPage/screen_first.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final screens = [
    const ScreenFirst(),
    const ScreenSecond(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ScreenFirst',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ScreenSecond',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}