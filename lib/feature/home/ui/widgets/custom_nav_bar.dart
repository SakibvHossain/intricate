import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/feature/home/data/controller/nav_controller.dart';

class CustomNavBar extends StatelessWidget {
  final navController = Get.find<NavController>();

  final icons = [
    Icons.home,
    Icons.card_giftcard,
    Icons.sticky_note_2,
    Icons.person,
  ];

  final labels = ['Home', "", "", ""];

  CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          boxShadow: [
            const BoxShadow(color: Colors.black12, blurRadius: 5),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            final isSelected = navController.currentIndex.value == index;
            return GestureDetector(
              onTap: () => navController.changeTab(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.shade100 : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[index],
                      color: isSelected ? Colors.blue : Colors.black54,
                    ),
                    if (isSelected)
                      const Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
