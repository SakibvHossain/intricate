import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intricate1/feature/home/data/controller/nav_controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(NavController());

  final List<Widget> screens = const [
    Center(child: Text('Home')),
    Center(child: Text('Plans')),
    Center(child: Text('Notes')),
    Center(child: Text('Profile')),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Obx(() => GNav(
              gap: 8,
              activeColor: Colors.white,
              color: Colors.grey[800],
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blueAccent,
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.search, text: 'Plans'),
                GButton(icon: Icons.person, text: 'Notes'),
                GButton(icon: Icons.person, text: 'Profile'),
              ],
              selectedIndex: controller.currentIndex.value,
              onTabChange: controller.changeTab,
            )),
          ),
        ),
      ),
    );
  }
}

// TermuxServer
