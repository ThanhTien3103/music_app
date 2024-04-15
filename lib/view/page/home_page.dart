import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/home_page_controller.dart';
import 'package:music_app/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomePageController>();
    return Obx(() => Scaffold(
        backgroundColor: ColorConstant.themeColor,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorConstant.themeColor,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeCurrent,
          iconSize: 30,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.orangeAccent,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'favorite',
            ),
          ],
        )));
  }
}
