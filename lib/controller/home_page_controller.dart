import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/model/audio.dart';
import 'package:music_app/view/page/home_scene.dart';

import '../repositories/list_audio_repository.dart';

class HomePageController extends GetxController {
  var currentIndex = 0.obs;
  var isLoading = true.obs;
  var _player;

  get player => _player;

  set player(value) {
    _player = value;
  }
  var listAudio = ListAudio();
  @override
  Future<void> onInit() async {
    player = AudioPlayer();
    listAudio = (await AudioRepository().fetchData())!;
    isLoading.value = false;
    super.onInit();
  }
  Widget currentPage = const HomeScene();
  var listPage = [const HomeScene(), const Scaffold()];
  void changeCurrent(int index){
    currentIndex.value = index;
    currentPage = listPage[index];
  }
  Future<void> playAudio(int index) async {
    await player.play(UrlSource(listAudio.data![index].preview!));
  }
}