import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/bindings.dart';
import 'package:music_app/controller/home_page_controller.dart';
import 'package:music_app/view/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitBindings(),
      initialRoute: "/home_page",
      routes: {
        "/home_page": (context) => const HomePage()
      },
    );
  }
}