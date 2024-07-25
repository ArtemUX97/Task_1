import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/first_page/controller.dart';
import 'package:task_1/second_page/controller.dart';
import 'home_page.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (contex) => CoinsNotifier()..init()),
          ChangeNotifierProvider(create: (contex) => OptionsNotifier()..init()),
        ],
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
        colorSchemeSeed: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

/// todo(artemizaak, 11.07.2024):
/// - внедрить пагинацию (посмотри также, что такое моковые данные, чтобы не
/// получить запрет от сервера на количество запросов)
/// - выбрать любой другой апи с сайта, получить и отобразить данные на новой странице ✅
/// - улучшить отображение значения стоимости, когда экран узок ✅
/// - добавить текстовый заголовок в Appbar ✅
///
/// todo(artemizaak, 18.07.2024):
/// - поправить именование папок ✅
/// - рассмотреть виджет PageView ✅
/// - попробуешь решить:
/// на одном экране (хотя тут это правильней назвать TabView) имеется в аппбаре иконка,
/// а на другом нетути. При переключениях она должна появляться пропадать. Аппбар у нас общий,
/// но внутри его метода build есть прослушивание отдельного нотифаера, отвечающего за "показать/скрыть иконку"
/// - подумать, каким образом мы смогли бы обновлять экран через RefreshIndicator
/// когда список данных пуст

