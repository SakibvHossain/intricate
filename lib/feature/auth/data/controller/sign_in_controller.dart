import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/helper/sheared_prefarences_helper.dart';
import 'package:intricate1/core/network_caller/service/service.dart';
import 'package:intricate1/core/network_caller/utils/utils.dart';
import 'package:intricate1/routes/app_routes.dart';
import 'package:logger/logger.dart';

class SignInController extends GetxController{
  RxBool isEyeOpen = true.obs;
  RxBool isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final preferencesHelper = SharedPreferencesHelper();
  final logger = Logger();

  Future<void> signIn() async {
    final Map<String, dynamic> registration = {
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    };

    try {
      isLoading.value = true;
      final String url = Utils.baseUrl + Utils.login;
      final response = await NetworkCaller().postRequest(
        url,
        body: registration,
      );
      if (response.isSuccess) {
        await preferencesHelper.setString('userToken', response.responseData['accessToken']);

      //  debugPrint('${preferencesHelper.getString('userToken')}');

        logger.i('${preferencesHelper.getString('userToken')}');
        emailController.clear();
        passwordController.clear();

        logger.i(response);
        //* Implement route
        Get.toNamed(AppRoute.onboarding);
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