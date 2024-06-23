import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Layout/mobile_layout.dart';
import 'Layout/screen_layout.dart';
import 'Layout/web_layout.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: colorDark,
        useMaterial3: true,
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: colorWhite,
        useMaterial3: true,
      ),
      title: 'GetsApp',
      debugShowCheckedModeBanner: false,
      home: LayoutBuilderScreen(
        mobileLayoutScreen: MobileLayoutScreen(),
        webLayoutScreen: WebLayoutScreen(),
      ),
    );
  }
}
