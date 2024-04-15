import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/home_page_controller.dart';

class HomeScene extends StatelessWidget {
  const HomeScene({super.key});
  Image buildImage(String md5Hash){
    return Image.network("https://e-cdns-images.dzcdn.net/images/cover/$md5Hash/100x100-000000-80-0-0.jpg");
  }
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomePageController>();
    return Obx(() => (!controller.isLoading.value)? Column(
      children: [
        const SizedBox(height: 60),
        Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: const CupertinoSearchTextField(
            backgroundColor: Colors.grey,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: controller.listAudio.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                    leading: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: buildImage(controller.listAudio.data![index].md5Image!)
                    ),
                    title: Text("${controller.listAudio.data?[index].title}\n ${controller.listAudio.data?[index].titleShort}", style: const TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.w600),),
                    trailing: SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SizedBox(width: 40,child: CupertinoButton(child: const Icon(Icons.play_arrow), onPressed: () {controller.playAudio(index);}),),SizedBox(width: 40,child: CupertinoButton(child: const Icon(Icons.favorite), onPressed: () {}),),],),
                    )
                ),
              );
            },

          ),
        )
      ],
    ) :
    const Center(
      child: CircularProgressIndicator(),
    )
        );
  }
}