import 'package:get/get.dart';
import 'package:music_app/controller/home_page_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}