import 'package:flutter/material.dart';
import 'package:intricate1/feature/onboarding/onboarding_1/ui/screen/onboarding_1.dart';
import 'package:intricate1/feature/onboarding/onboarding_2/ui/screen/onboarding_2.dart';
import 'package:intricate1/feature/onboarding/onboarding_3/ui/screen/onboarding_3.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        children: [
          Onboarding1(),
          Onboarding2(),
          Onboarding3(),
        ],
      ),
    );
  }
}
