import 'package:encrypt/encrypt.dart' hide Key;
import 'package:encrypt/encrypt.dart' as encrypt show Key;
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ton_place/features/home/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ru_RU');
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
