import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/core/components/custom_button.dart';
import 'package:intricate1/core/components/custom_button_dev_2.dart';
import 'package:intricate1/core/components/custom_textformfield_dev_2.dart';
import 'package:intricate1/feature/plan/View/create_plan_screen.dart';
import 'package:intricate1/feature/subscription/controller/billing_controller.dart';
import 'package:intricate1/feature/subscription/controller/subscription_controller.dart';

class PaymentView extends StatelessWidget {
  PaymentView({super.key});

  final BillingController _billingController = Get.find();
  final SubscriptionController _subscriptionController =
      Get.put(SubscriptionController());

  final List<String> countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua & Deps',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina',
    'Burundi',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Cape Verde',
    'Central African Rep',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo',
    'Congo {Democratic Rep}',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'East Timor',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland {Republic}',
    'Israel',
    'Italy',
    'Ivory Coast',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea North',
    'Korea South',
    'Kosovo',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar, {Burma}',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russian Federation',
    'Rwanda',
    'St Kitts & Nevis',
    'St Lucia',
    'Saint Vincent & the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome & Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Togo',
    'Tonga',
    'Trinidad & Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ].obs;

  @override
  Widget build(BuildContext context) {
    log('Current selected plan: ${_subscriptionController.selectedPlan.value}');
    log(
      'All plans: ${_subscriptionController.plans.map((p) => p.title).toList()}',
    );
    // final double responsiveHeight = MediaQuery.of(context).size.height * 0.65;

    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController expiryController = TextEditingController();
    final TextEditingController cvcController = TextEditingController();
    final TextEditingController nameOnCardController = TextEditingController(
        // text:
        //     '${_billingController.billingInfo.value.firstName} ${_billingController.billingInfo.value.lastName}',
        );
    final TextEditingController countryController = TextEditingController(
        // text: _billingController.billingInfo.value.country,
        );
    final TextEditingController zipCodeController = TextEditingController(
      text: _billingController.billingInfo.value.zipCode,
    );

    cardNumberController.addListener(() {
      _billingController.billingInfo.update((info) {
        info?.address = cardNumberController.text;
      });
    });
    expiryController.addListener(() {
      _billingController.billingInfo.update((info) {
        info?.city = expiryController.text;
      });
    });
    cvcController.addListener(() {
      _billingController.billingInfo.update((info) {
        info?.state = cvcController.text;
      });
    });
    nameOnCardController.addListener(() {
      _billingController.billingInfo.update((info) {
        info?.additionalInfo = nameOnCardController.text;
      });
    });
    countryController.addListener(() {
      _billingController.billingInfo.update((info) {
        info?.country = countryController.text;
      });
    });
    zipCodeController.addListener(() {
      _billingController.billingInfo.update((info) {
        info?.zipCode = zipCodeController.text;
      });
    });

    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFCFCFC)),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card Information',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFCFCFC)),
                      ),
                      SizedBox(height: 3.h),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xffFCFCFC4D).withAlpha(30)),
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white.withAlpha(4)),
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: '4242 5859 5684 2585',
                              textEditingController: cardNumberController,
                              borderSide: BorderSide(color: Color(0xFF667085)),
                              fillColor: Colors.white.withAlpha(4),
                              borderradius: 0,
                            ),
                            CustomTextField(
                              hintText: 'MM/YY',
                              textEditingController: expiryController,
                              borderSide: BorderSide(color: Color(0xFF667085)),
                              fillColor: Colors.white.withAlpha(4),
                              borderradius: 0,
                            ),
                            CustomTextField(
                              hintText: 'CVC',
                              textEditingController: cvcController,
                              borderSide: BorderSide(color: Color(0xFF667085)),
                              fillColor: Colors.white.withAlpha(4),
                              borderradius: 0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Name On Card',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFCFCFC)),
                      ),
                      SizedBox(height: 5.h),
                      CustomTextField(
                        hintText:
                            '3891 Ranchview Dr. Richardson, California 62639',
                        textEditingController: nameOnCardController,
                        borderSide:
                            BorderSide(color: Color(0xffFCFCFC).withAlpha(30)),
                        fillColor: Colors.white.withAlpha(4),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Country or Region',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFCFCFC)),
                      ),
                      SizedBox(height: 5.h),
                      CustomTextField(
                        hintText: 'United States',
                        textEditingController: countryController,
                        isDropdown: true,
                        dropdownItems: countries,
                        onDropdownChanged: (value) {
                          countryController.text = value ?? '';
                        },
                        borderSide:
                            BorderSide(color: Color(0xffFCFCFC).withAlpha(30)),
                        fillColor: Colors.white.withAlpha(4),
                        borderradius: 0,
                      ),
                      CustomTextField(
                        hintText: '10001',
                        textEditingController: zipCodeController,
                        borderSide:
                            BorderSide(color: Color(0xffFCFCFC).withAlpha(30)),
                        fillColor: Colors.white.withAlpha(4),
                        borderradius: 0,
                      ),
                      SizedBox(height: 15.h),
                      Obx(() {
                        final selectedPlan =
                            _subscriptionController.plans.firstWhere(
                          (plan) =>
                              plan.title ==
                              _subscriptionController.selectedPlan.value,
                          orElse: () => _subscriptionController.plans.first,
                        );

                        return ComponentCustomButton(
                          onTap: _processPayment,
                          text: 'Pay Now (${selectedPlan.price})',
                          borderRadius: 12.r,
                          height: 56.h,
                          gradientColors: [
                            Color(0xff7EB243),
                            Color(0xff024015)
                          ],
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _processPayment() {
    Get.to(() => PlanView());
    Get.snackbar(
      'Payment Successful',
      'You have subscribed to ${_subscriptionController.selectedPlan.value} plan',
      backgroundColor: Colors.green,
      duration: Duration(milliseconds: 1800),
      borderRadius: 12.r,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }
}
