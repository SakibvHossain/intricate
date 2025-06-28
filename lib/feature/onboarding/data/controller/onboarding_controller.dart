import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentStep = 1.obs;
  var feelingToday = ''.obs;
  var hardestPart = ''.obs;

  void selectFeeling(String value) {
    feelingToday.value = value;
  }

  void selectHardest(String value) {
    hardestPart.value = value;
  }
}
