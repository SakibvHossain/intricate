class AppRoute{
  static const String splash = '/splash';
  static const String navBar = '/navHome';
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';
  static const String trail = '/trail';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  static String initialPage() => splash;
  static String signUpPage() => signUp;
  static String signInPage() => signIn;
  static String homePage() => navBar;
  static String trailPage() => trail;
  static String onboardingPage() => onboarding;
  static String homePage2() => home;
}