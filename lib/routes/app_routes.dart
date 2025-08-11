class AppRoute{
  static const String splash = '/splash';
  static const String authType = '/auth-type';
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';
  static const String trail = '/trail';
  static const String questionScreen = '/questionScreen';
  static const String onboarding = '/onboarding';
  static const String navBar = '/navBar';
  static const String home = '/home';
   static const String home_screen = '/home_screen';
  static const String otp = '/otp';
  static const String brandYou = '/brandYou';
  static const String note_page='/note_page';

  static String onboardingPage() => onboarding;
  static String initialPage() => splash;
  static String signUpPage() => signUp;
  static String signInPage() => signIn;
  static String homePage() => navBar;
  static String trailPage() => trail;
  static String bottomNav() => home;
  static String otpPage() => otp;
}