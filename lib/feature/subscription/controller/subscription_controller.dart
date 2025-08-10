// subscription_controller.dart
import 'dart:developer';
import 'package:get/get.dart';
import 'package:intricate1/feature/subscription/model/subscription_model.dart';

class SubscriptionController extends GetxController {
  final RxList<SubscriptionPlan> plans = <SubscriptionPlan>[
    SubscriptionPlan(
      title: 'Basic Plan',
      price: '\$9',
      features: ['Routine only'],
    ),
    SubscriptionPlan(
      title: 'Plus Plan',
      price: '\$12',
      features: ['Routine', 'Journal', 'Insights'],
      isPopular: true,
    ),
    SubscriptionPlan(
      title: 'Pro Plan',
      price: '\$16',
      features: ['AI features', 'Priority Support'],
    ),
  ].obs;

  final RxString selectedPlan = ''.obs;

  void setSelectedPlan(String planTitle) {
    selectedPlan.value = planTitle;
    log('Selected plan: $planTitle');
  }
}
