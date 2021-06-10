import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasil_tani/themes/themes.dart';
import 'package:hasil_tani/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hasil Tani',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: mainBlueColor),
      home: MainPage(),
      builder: BotToastInit(),
    );
  }
}
