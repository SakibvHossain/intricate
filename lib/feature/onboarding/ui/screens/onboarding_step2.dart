import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/feature/onboarding/data/controller/onboarding_controller.dart';

class OnboardingStep2 extends StatelessWidget {
  final controller = Get.find<OnboardingController>();

  final List<String> options = [
    'Sleep – I’ve been struggling to get enough rest.',
    'Energy – I just don’t feel energized throughout the day.',
    'Motivation – It’s hard to stay focused or get started.',
    'Mood – I’m feeling emotionally drained or overwhelmed.',
  ];

  @override
  Widget build(BuildContext context) {
    controller.currentStep.value = 2;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Get.back()),
        title: Obx(() => Text('Step ${controller.currentStep.value} out of 5')),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('What’s been hardest for you lately?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Let’s pinpoint what’s been the most challenging for you.'),
              const SizedBox(height: 24),
              ...options.map((option) => Obx(() {
                final bool selected = controller.hardestPart.value == option;
                return GestureDetector(
                  onTap: () => controller.selectHardest(option),
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
                  if (controller.hardestPart.isNotEmpty) {
                    // Go to next step
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
