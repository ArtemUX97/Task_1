import 'package:flutter/material.dart';
import 'package:task_1/second_page/screen_second.dart';

import 'first_page/screen_first.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: screens[_selectedPageIndex],
      body: PageView(
        controller: _pageController,
        children: const [
          ScreenFirst(),
          ScreenSecond(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        onTap: _openPage,
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
    );
  }

  void _openPage (index){
    setState(() {
      _selectedPageIndex = index;
      _pageController.jumpToPage(index);
    });
}

}