import 'package:get/get.dart';
import 'package:intricate1/feature/profile/bindings/change_profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeProfileController());
  }
}