import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/helper/sheared_prefarences_helper.dart';
import 'package:intricate1/core/network_caller/service/service.dart';
import 'package:intricate1/core/network_caller/utils/utils.dart';
import 'package:intricate1/routes/app_routes.dart';
import 'package:logger/logger.dart';

class SignInController extends GetxController {
  RxBool isEyeOpen = true.obs;
  RxBool isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   final preferencesHelper = SharedPreferencesHelper();
  final logger = Logger();  // Logger instance for logging

  // Validation logic for empty email or password
  String? validateEmail(String email) {
    if (email.isEmpty) return 'Email cannot be empty';
    if (!GetUtils.isEmail(email)) return 'Invalid email address';
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return 'Password cannot be empty';
    if (password.length < 6) return 'Password must be at least 6 characters long';
    return null;
  }

  Future<void> signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Log email and password data (be cautious with sensitive info in production)
    logger.i('Sign In Attempt - Email: $email, Password: $password');

    // Validate email and password
    final emailError = validateEmail(email);
    final passwordError = validatePassword(password);

    if (emailError != null) {
      logger.e('Validation Error - Email: $emailError');
      Get.snackbar('Error', emailError, backgroundColor: Colors.red);
      return;
    }

    if (passwordError != null) {
      logger.e('Validation Error - Password: $passwordError');
      Get.snackbar('Error', passwordError, backgroundColor: Colors.red);
      return;
    }

    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password,
    };

    try {
      isLoading.value = true;
      final String url = Utils.baseUrl + Utils.login;
      final response = await NetworkCaller().postRequest(
        url,
        body: loginData,
      );

      // Log the full response for debugging purposes
      logger.i('Response: ${response.responseData}');

      if (response.isSuccess && response.responseData != null) {
        final accessToken = response.responseData['accessToken'];

        // Save the token in shared preferences
        await preferencesHelper.setString('accessToken', accessToken);

        // Log success and navigate to the next screen
        logger.i('Login Successful, Token saved');
        Get.toNamed(AppRoute.brandYou);  // Redirect to the brandYou route
      } else if (response.statusCode == 409) {
        logger.w('Email already exists: ${loginData['email']}');
        Get.snackbar('Email Exist', 'This email is already used', backgroundColor: const Color(0xffF44336));
      } else {
        logger.e('Login Failed - Status Code: ${response.statusCode}, Response: ${response.responseData}');
        Get.snackbar('Error', 'Something went wrong', backgroundColor: Colors.red);
      }
    } catch (e) {
      logger.e('Error during Sign In: $e');
      debugPrint('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

}
