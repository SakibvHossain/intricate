import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/feature/profile/bindings/change_profile_controller.dart';
import 'package:intricate1/feature/profile/ui/screens/profile_screen.dart';

class ChangeProfileScreen extends StatelessWidget {
  ChangeProfileScreen({super.key});

  final changeProfileController = Get.put(ChangeProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(changeProfileController.selectedIndex.value == 0){
        return const ProfileScreen();
      }else if(changeProfileController.selectedIndex.value == 1){
        return const ProfileScreen();
      }else{
        return const ProfileScreen();
      }
    });
  }
}
