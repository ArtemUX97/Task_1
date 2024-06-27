import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/List/controller.dart';
import 'package:task_1/screen.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => CoinsNotifier()..init(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(246, 247, 248, 1),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
