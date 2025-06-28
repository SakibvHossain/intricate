import 'package:get/get.dart';
import 'package:intricate1/feature/home/ui/screens/home_screen.dart';
import 'package:intricate1/feature/onboarding/ui/screens/onboarding_step1.dart';
import 'package:intricate1/feature/onboarding/ui/screens/splash_screen.dart';
import 'package:intricate1/feature/onboarding/ui/screens/trail_screen.dart';
import 'package:intricate1/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoute.splash,
        page: () => const SplashScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.trail,
        page: () => const TrailScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.onboarding,
        page: () => OnboardingStep1(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.home,
        page: () => HomeScreen(),
        transition: Transition.rightToLeft),
  ];
}
