import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController{
  final selectedIndex = 0.obs;

  void updateIndex(int index){
    selectedIndex.value = index;
  }
}