import 'package:get/get.dart';
import 'package:intricate1/feature/subscription/model/billing_model.dart';

class BillingController extends GetxController {
  final Rx<BillingInfo> billingInfo = BillingInfo(
    firstName: 'Saifur',
    lastName: 'Rahman',
    phone: '+880 1567809747',
    email: 'us.sailur.info@gmail.com',
    country: 'United States',
    address: '3891 Ranchview Dr. Richardson, California 626',
    city: 'State',
    state: '',
    zipCode: '',
    additionalInfo:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
  ).obs;

  final RxString selectedPlan = ''.obs;

  void setSelectedPlan(String plan) {
    selectedPlan.value = plan;
  }
}
