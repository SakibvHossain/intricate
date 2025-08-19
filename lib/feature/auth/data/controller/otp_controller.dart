import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/network_caller/service/service.dart';
import 'package:intricate1/core/network_caller/utils/utils.dart';
import 'package:intricate1/routes/app_routes.dart';
import 'package:logger/logger.dart';

class OtpController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final otpCodeController = TextEditingController();

  // Initialize logger
  final logger = Logger();

  // Variable to store the accessToken temporarily in memory
  String? accessToken;

  Future<void> verifyOTP() async {
    final Map<String, dynamic> verifyOtp = {
      'email': emailController.text.isNotEmpty ? emailController.text : '',
      'otp': otpCodeController.text.isNotEmpty ? int.parse(otpCodeController.text.trim()) : 0,
    };

    try {
      isLoading.value = true;
      final String url = Utils.baseUrl + Utils.verifyOTP;

      // Log email and OTP
      logger.d('Email: ${emailController.text.trim()}');
      logger.d('OTP: ${otpCodeController.text.trim()}');

      final response = await NetworkCaller().postRequest(
        url,
        body: verifyOtp,
      );

      if (response.isSuccess) {
          // Clear the text fields
          emailController.clear();
          otpCodeController.clear();

          // Implement route navigation
          Get.toNamed(AppRoute.signIn);
      } else if (response.statusCode == 404) {
        Get.snackbar('Email Exist', 'This email already been used', backgroundColor: const Color(0xffF44336));
      }
    } catch (e) {
      // Log any error that occurs
      logger.e('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}


