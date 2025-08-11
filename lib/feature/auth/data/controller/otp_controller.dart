import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/helper/sheared_prefarences_helper.dart';
import 'package:intricate1/core/network_caller/service/service.dart';
import 'package:intricate1/core/network_caller/utils/utils.dart';
import 'package:intricate1/feature/brand_you/ui/screen/brand_you_screen.dart';
import 'package:intricate1/routes/app_routes.dart';

class OtpController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final otpCodeController = TextEditingController();

  final preferencesHelper = SharedPreferencesHelper();

  Future<void> verifyOTP() async {
    final Map<String, dynamic> verifyOtp = {
      'email': emailController.text.trim(),
      'otp': int.parse(otpCodeController.text.trim()),
    };

    try {
      isLoading.value = true;
      final String url = Utils.baseUrl + Utils.verifyOTP;


      debugPrint(emailController.text.trim());
      debugPrint('${int.parse(otpCodeController.text.trim())}');

      final response = await NetworkCaller().postRequest(
        url,
        body: verifyOtp,
      );

      if (response.isSuccess) {
        await preferencesHelper.setString('userToken', response.responseData['accessToken']);
        emailController.clear();
        otpCodeController.clear();

        //* Implement route
        Get.offAll(()=>const BrandYouScreen());
        // Get.toNamed(AppRoute.signIn);
      } else if (response.statusCode == 409) {
        Get.snackbar('Email Exist', 'This email already been used', backgroundColor: const Color(0xffF44336));
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
