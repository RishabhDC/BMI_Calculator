import 'package:bmi_cal/Config/Theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: lightTheme,
      darkTheme: darkTheme,
      home:HomePage()
    );
  }
}
