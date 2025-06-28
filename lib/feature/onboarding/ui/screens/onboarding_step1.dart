import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/feature/onboarding/data/controller/onboarding_controller.dart';
import 'package:intricate1/feature/onboarding/ui/screens/onboarding_step2.dart';
import 'package:intricate1/feature/onboarding/ui/widgets/step_progress_bar.dart';

class OnboardingStep1 extends StatelessWidget {
  final controller = Get.put(OnboardingController());

  final List<String> options = [
    "I'm feeling good!",
    "I'm okay, not great, not bad.",
    "I'm feeling a bit low.",
    "I'm feeling really down today.",
  ];

  OnboardingStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Step 1 out of 5', style: TextStyle(color: Colors.blueGrey)),

              const CustomProgressBar(progress: 1.0),

              const SizedBox(height: 16),
              const Text('How are you feeling today?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Let’s understand how you’re feeling today.'),
              const SizedBox(height: 24),
              ...options.map((option) => Obx(() {
                final bool selected = controller.feelingToday.value == option;
                return GestureDetector(
                  onTap: () => controller.selectFeeling(option),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: selected ? Colors.green[100] : Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(option),
                  ),
                );
              })),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (controller.feelingToday.isNotEmpty) {
                    Get.to(() => OnboardingStep2());
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Next'), Icon(Icons.arrow_forward)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
