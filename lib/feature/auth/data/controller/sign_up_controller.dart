import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/helper/sheared_prefarences_helper.dart';
import 'package:intricate1/core/network_caller/service/service.dart';
import 'package:intricate1/core/network_caller/utils/utils.dart';
import 'package:intricate1/feature/auth/ui/screens/otp_screen.dart';
import 'package:intricate1/feature/auth/ui/screens/sign_in_screen.dart';

class SignUpController extends GetxController{
  RxBool isEyeOpen = true.obs;
  RxBool isLoading = false.obs;

  final fullNameController = TextEditingController();
  // final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final preferencesHelper = SharedPreferencesHelper();

  Future<void> signUp() async {
    final Map<String, dynamic> registration = {
      'fullName': fullNameController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text,
      'mobileNumber': mobileController.text.trim(),
    };

    try {
      isLoading.value = true;
      final String url =Utils.baseUrl + Utils.userRegister;
      final response = await NetworkCaller().postRequest(
        url,
        body: registration,
      );
      if (response.isSuccess) {
        emailController.clear();
        passwordController.clear();
        fullNameController.clear();
        passwordController.clear();
        //userNameController.clear();
         mobileController.clear();

        //* Implement route
        Get.to(() => OtpScreen(),arguments: emailController.text);
      }else if(response.statusCode == 404){
        Get.snackbar('Email Exist', 'This email already been used', backgroundColor: const Color(0xffF44336));
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}