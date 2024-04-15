import 'package:get/get.dart';

class HomePageController extends GetxController {
  var currentIndex = 0.obs;
  void changeCurrent(int index){
    currentIndex.value = index;
  }

}