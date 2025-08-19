import 'package:get/get.dart';

class NavbarController extends GetxController {
  static NavbarController get to => Get.find();

  RxInt currentIndex = 0.obs;
  RxBool isVisible = true.obs;

  void changeTab(int index) => currentIndex.value = index;

  void show() => isVisible.value = true;
  void hide() => isVisible.value = false;
}
