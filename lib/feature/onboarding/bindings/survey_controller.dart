import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/helper/sheared_prefarences_helper.dart';
import 'package:intricate1/core/network_caller/service/service.dart';
import 'package:intricate1/core/network_caller/utils/utils.dart';
import 'package:intricate1/feature/home/ui/screens/bottom_nav_screen.dart';
import 'package:intricate1/feature/onboarding/data/controller/assessment_controller.dart';
import 'package:intricate1/feature/onboarding/ui/screens/ready_plan.dart';
import 'package:logger/logger.dart';

class SurveyController extends GetxController{
  RxBool isEyeOpen = true.obs;
  RxBool isLoading = false.obs;
  final preferencesHelper = SharedPreferencesHelper();
  final assessmentController = Get.put(AssessmentController());
  final logger = Logger();

  Future<void> surveyResponse() async {

    final Map<String, dynamic> survey = {
      'responses': assessmentController.questionLists,
    };

    try {
      isLoading.value = true;
      final String url = Utils.baseUrl + Utils.survey;
      final response = await NetworkCaller().postRequest(
        url,
        body: survey,
        token: preferencesHelper.getString('userToken')
      );
      debugPrint('+++++++++++++++++++++++++++++++++++++${preferencesHelper.getString('userToken')}');
      if (response.isSuccess) {
        logger.i(response);
        //* Implement route
        Get.to(ReadyPlan());
        Get.snackbar(
          'Success',
          'Assessment plan is ready!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
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