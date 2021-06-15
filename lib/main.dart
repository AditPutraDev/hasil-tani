import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hasil_tani/shared/themes.dart';
import 'package:hasil_tani/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle mySystemUIOverlaySyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      systemNavigationBarDividerColor: Colors.green[200],
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white, // status bar color
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(mySystemUIOverlaySyle);
    return GetMaterialApp(
      title: 'Hasil Tani',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: greenColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
      builder: BotToastInit(),
    );
  }
}
