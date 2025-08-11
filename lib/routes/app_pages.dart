import 'package:get/get.dart';
import 'package:intricate1/feature/auth/ui/screens/otp_screen.dart';
import 'package:intricate1/feature/auth/ui/screens/select_authtype_screen.dart';
import 'package:intricate1/feature/auth/ui/screens/sign_in_screen.dart';
import 'package:intricate1/feature/auth/ui/screens/sign_up_screen.dart';
import 'package:intricate1/feature/brand_you/ui/screen/brand_you_screen.dart';
import 'package:intricate1/feature/define_your_path/ui/question_screen.dart';
import 'package:intricate1/feature/home/ui/screens/bottom_nav_screen.dart';
import 'package:intricate1/feature/notes/ui/screens/note_page.dart';
import 'package:intricate1/feature/onboarding/ui/screens/assessment_page.dart';
import 'package:intricate1/feature/onboarding/ui/screens/splash_screen.dart';
import 'package:intricate1/feature/onboarding/ui/screens/trail_screen.dart';
import 'package:intricate1/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoute.splash,
      page: () => const SplashScreen(),
      transition: Transition.rightToLeft,
    ),GetPage(
      name: AppRoute.authType,
      page: () => const AuthTypeScreen(),
      //transition: Transition.rightToLeft,
    ),GetPage(
      name: AppRoute.questionScreen,
      page: () =>  TextQuestionScreen(),
      //transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoute.trail,
      page: () => const TrailScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoute.home,
      page: () => BottomNavScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoute.onboarding,
      page: () => AssessmentPage(),
      transition: Transition.rightToLeft,
    ),
    // GetPage(
    //   name: AppRoute.signIn,
    //   page: () => SignInScreen(),
    //   transition: Transition.leftToRight,
    // ),
    GetPage(
      name: AppRoute.signUp,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoute.otp,
      page: () => OtpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoute.brandYou,
      page: () => BrandYouScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(name: AppRoute.note_page, page: ()=>NotePage())
  ];
}
