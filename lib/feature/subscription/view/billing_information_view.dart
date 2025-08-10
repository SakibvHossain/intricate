import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_button_dev_2.dart';
import 'package:intricate1/core/components/custom_textformfield_dev_2.dart';
import 'package:intricate1/feature/subscription/controller/billing_controller.dart';
import 'package:intricate1/feature/subscription/view/payment_view.dart';

class BillingInformationView extends StatelessWidget {
  BillingInformationView({super.key});

  final BillingController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController(
      text: _controller.billingInfo.value.firstName,
    );
    final lastNameController = TextEditingController(
      text: _controller.billingInfo.value.lastName,
    );
    final phoneController = TextEditingController(
      text: _controller.billingInfo.value.phone,
    );
    final emailController = TextEditingController(
      text: _controller.billingInfo.value.email,
    );
    final countryController = TextEditingController(
      text: _controller.billingInfo.value.country,
    );
    final addressController = TextEditingController(
      text: _controller.billingInfo.value.address,
    );
    final cityController = TextEditingController(
      text: _controller.billingInfo.value.city,
    );
    final stateController = TextEditingController(
      text: _controller.billingInfo.value.state,
    );
    final zipCodeController = TextEditingController(
      text: _controller.billingInfo.value.zipCode,
    );
    final additionalInfoController = TextEditingController(
      text: _controller.billingInfo.value.additionalInfo,
    );

    // Update BillingInfo when text changes
    firstNameController.addListener(() {
      _controller.billingInfo.update((info) {
        info?.firstName = firstNameController.text;
      });
    });
    lastNameController.addListener(() {
      _controller.billingInfo.update((info) {
        info?.lastName = lastNameController.text;
      });
    });
    phoneController.addListener(() {
      _controller.billingInfo.update((info) {
        info?.phone = phoneController.text;
      });
    });
    emailController.addListener(() {
      _controller.billingInfo.update((info) {
        info?.email = emailController.text;
      });
    });
    countryController.addListener(() {
      _controller.billingInfo.update((info) {
        info?.country = countryController.text;
      });
    });
    addressController.addListener(() {
      _controller.billingInfo.update((info) {
        info?.address = addressController.text;
      });
    });
    cityController.addListener(() {
      _controller.billingInfo.update((info) {
        info?.city = cityController.text;
      });
    });
    stateController.addListener(() {
      _controller.billingInfo.update((info) {
        info?.state = stateController.text;
      });
    });
    zipCodeController.addListener(() {
      _controller.billingInfo.update((info) {
        info?.zipCode = zipCodeController.text;
      });
    });
    additionalInfoController.addListener(() {
      _controller.billingInfo.update((info) {
        info?.additionalInfo = additionalInfoController.text;
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Selected Plan: ${_controller.selectedPlan.value}',
              //   style: TextStyle(
              //     fontSize: 16.sp,
              //     fontWeight: FontWeight.bold,
              //     color: Color(0xFF5F6CAF),
              //   ),
              // ),
              // SizedBox(height: 30.h),
              Text(
                'Billing Information',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('First Name', style: TextStyle(fontSize: 16.sp)),
              ),
              CustomTextField(
                hintTextColor: Colors.grey[500],
                fillColor: Color(0xFFFFFFFF),
                textColor: Colors.black,
                borderSide: BorderSide(color: Color(0xFF98A2B3)),
                hintText: 'First Name',
                textEditingController: firstNameController,
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Last Name', style: TextStyle(fontSize: 16.sp)),
              ),
              CustomTextField(
                hintTextColor: Colors.grey[500],
                fillColor: Color(0xFFFFFFFF),
                textColor: Colors.black,
                borderSide: BorderSide(color: Color(0xFF98A2B3)),
                hintText: 'Last Name',
                textEditingController: lastNameController,
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Phone', style: TextStyle(fontSize: 16.sp)),
              ),
              CustomTextField(
                hintTextColor: Colors.grey[500],
                fillColor: Color(0xFFFFFFFF),
                textColor: Colors.black,
                borderSide: BorderSide(color: Color(0xFF98A2B3)),
                hintText: 'Phone',
                textEditingController: phoneController,
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Email', style: TextStyle(fontSize: 16.sp)),
              ),
              CustomTextField(
                hintTextColor: Colors.grey[500],
                fillColor: Color(0xFFFFFFFF),
                textColor: Colors.black,
                borderSide: BorderSide(color: Color(0xFF98A2B3)),
                hintText: 'Email',
                textEditingController: emailController,
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Country/Region',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              CustomTextField(
                hintTextColor: Colors.grey[500],
                fillColor: Color(0xFFFFFFFF),
                textColor: Colors.black,
                borderSide: BorderSide(color: Color(0xFF98A2B3)),
                hintText: 'Country/Region',
                textEditingController: countryController,
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Address', style: TextStyle(fontSize: 16.sp)),
              ),
              CustomTextField(
                hintTextColor: Colors.grey[500],
                fillColor: Color(0xFFFFFFFF),
                textColor: Colors.black,
                borderSide: BorderSide(color: Color(0xFF98A2B3)),
                hintText: 'Address',
                textEditingController: addressController,
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                hintTextColor: Colors.grey[500],
                fillColor: Color(0xFFFFFFFF),
                textColor: Colors.black,
                borderSide: BorderSide(color: Color(0xFF98A2B3)),
                hintText: 'City',
                textEditingController: cityController,
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                hintTextColor: Colors.grey[500],
                fillColor: Color(0xFFFFFFFF),
                textColor: Colors.black,
                borderSide: BorderSide(color: Color(0xFF98A2B3)),
                hintText: 'State',
                textEditingController: stateController,
              ),

              SizedBox(height: 15.h),
              CustomTextField(
                height: 50.h,
                hintTextColor: Colors.grey[500],
                fillColor: Color(0xFFFFFFFF),
                textColor: Colors.black,
                borderSide: BorderSide(color: Color(0xFF98A2B3)),
                hintText: 'ZIP Code',
                textEditingController: zipCodeController,
              ),
              // Divider(thickness: 1, height: 40.h),
              SizedBox(height: 15.h),
              Text('Additional Information', style: TextStyle(fontSize: 18.sp)),
              SizedBox(height: 10.h),
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Color(0xFF98A2B3)),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: TextField(
                    controller: additionalInfoController,
                    maxLines: 8,
                    style: TextStyle(color: Color(0xFF98A2B3), fontSize: 16.sp),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter additional information",
                      hintStyle: TextStyle(color: Color(0xFF333333)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              CustomButton(
                onPressed: () {
                  Get.to(() => PaymentView());
                },
                text: 'Next',
                backgroundColor: Color(0xFF5F6CAF),
                borderRadius: 5.r,
                suffixIcon: Icon(Icons.arrow_forward, color: Colors.white),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
