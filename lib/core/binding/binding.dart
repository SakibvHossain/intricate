import 'package:get/get.dart';
import 'package:intricate1/feature/onboarding/data/controller/splash_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(SplashController());
  }
}
