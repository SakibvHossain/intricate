import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/helper/sheared_prefarences_helper.dart';
import 'package:intricate1/core/network_caller/service/service.dart';
import 'package:intricate1/core/network_caller/utils/utils.dart';
import 'package:intricate1/feature/auth/ui/screens/otp_screen.dart';

class SignUpController extends GetxController{
  RxBool isEyeOpen = true.obs;
  RxBool isLoading = false.obs;

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final preferencesHelper = SharedPreferencesHelper();

  Future<void> signUp() async {
    final Map<String, dynamic> registration = {
      'fullName': fullNameController.text.trim(),
      'userName': userNameController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
      // 'phone': passwordController.text.trim(),
    };

    try {
      isLoading.value = true;
      final String url = Utils.baseUrl + Utils.signUp;
      final response = await NetworkCaller().postRequest(
        url,
        body: registration,
      );
      if (response.isSuccess) {
        emailController.clear();
        passwordController.clear();
        fullNameController.clear();
        userNameController.clear();
        // mobileController.clear();

        //* Implement route
        Get.to(() => OtpScreen());
      }else if(response.statusCode == 409){
        Get.snackbar('Email Exist', 'This email already been used', backgroundColor: const Color(0xffF44336));
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}