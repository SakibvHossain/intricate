import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/feature/home/data/controller/nav_controller.dart';
import 'package:intricate1/feature/home/ui/screens/home_page.dart';
import 'package:intricate1/feature/home/ui/screens/home_screen.dart';
import 'package:intricate1/feature/home/ui/screens/note_screen.dart';
import 'package:intricate1/feature/home/ui/screens/plans_screen.dart';
import 'package:intricate1/feature/notes/ui/screens/note_history_page.dart';
import 'package:intricate1/feature/plan/View/create_plan_screen.dart';
import 'package:intricate1/feature/profile/ui/screens/profile_screen.dart';
import 'package:intricate1/feature/home/ui/widgets/tab_item.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final controller = Get.put(NavController());

  final List<TabItem> tabItems = [
    TabItem(
      button: const GButton(icon: Icons.home, text: 'Home'),
      screen: HomePage(),
    ),
    TabItem(
      button: const GButton(icon: Icons.search, text: 'Plans'),
      screen: PlanView(),
    ),
    TabItem(
      button: const GButton(icon: Icons.note, text: 'Notes'),
      screen: NoteHistoryPage(),
    ),
    // TabItem(
    //   button: const GButton(icon: Icons.person, text: 'Profile'),
    //   screen: const ProfileScreen(),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        body: Obx(() => tabItems[controller.currentIndex.value].screen),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Color(0xff2f3533), boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Obx(() => GNav(
                    gap: 8,
                    activeColor: Color(0xff00D700),
                    color: Color(0xffFCFCFC),
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.transparent,
                    tabs: [
                      const GButton(icon: LucideIcons.home, text: 'Home'),
                      const GButton(icon: LucideIcons.box, text: 'Plans'),
                      const GButton(
                          icon: LucideIcons.stickyNote, text: 'Notes'),
                      // const GButton(icon: LucideIcons.user, text: 'Profile'),
                    ],
                    selectedIndex: controller.currentIndex.value,
                    onTabChange: controller.changeTab,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

// TermuxServer
