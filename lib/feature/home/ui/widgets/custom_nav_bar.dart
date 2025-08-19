import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/feature/home/data/controller/nav_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomNavbarOverlay extends StatelessWidget {
  const CustomNavbarOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!NavbarController.to.isVisible.value) return const SizedBox.shrink();

      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 90,
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.black26.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.3))
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavIcon(LucideIcons.home, 0, "Home"),
                const SizedBox(width: 20),
                _buildNavIcon(LucideIcons.box, 1, "Box"),
                const SizedBox(width: 20),
                _buildNavIcon(LucideIcons.stickyNote, 2, "Notes"),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildNavIcon(IconData icon, int index, String label) {
    return GestureDetector(
      onTap: () => NavbarController.to.changeTab(index),
      child: Obx(() {
        bool isSelected = NavbarController.to.currentIndex.value == index;
        return Column(
          mainAxisSize: MainAxisSize.min, // so column shrinks to content
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack, // nice pop-up effect
              transform: Matrix4.identity()
                ..translate(0.0, isSelected ? -10.0 : 0.0) // moves icon up
                ..scale(isSelected ? 1.3 : 1.0), // scales icon
              child: Icon(
                icon,
                color: isSelected ? Colors.green : Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

}
