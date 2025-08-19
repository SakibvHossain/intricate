import 'package:flutter/material.dart';
import 'package:intricate1/feature/home/ui/widgets/custom_nav_bar.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;

  const BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 80), // leave space for navbar
          child: child, // Your screen content
        ),
         const CustomNavbarOverlay(),

        // Always on top
      ],
    );
  }
}
