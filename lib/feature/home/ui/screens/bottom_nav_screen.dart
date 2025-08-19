import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/feature/home/data/controller/nav_controller.dart';
import 'package:intricate1/feature/home/ui/screens/home_screen.dart';
import 'package:intricate1/feature/home/ui/widgets/custom_nav_bar.dart';
import 'package:intricate1/feature/notes/ui/screens/note_history_page.dart';
import 'package:intricate1/feature/plan/View/create_plan_screen.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});
  static const String routeName = '/bottom-nav-screen';

  final NavbarController controller = Get.put(NavbarController());

  final List<Widget> screens = [
    HomeScreen(),
    PlanView(),
    NoteHistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Obx(() {
        return Stack(
          children: [
            // Display the selected screen based on currentIndex
            screens[controller.currentIndex.value],

            // Bottom navbar overlay
            const CustomNavbarOverlay(),
          ],
        );
      }),
    );
  }
}
