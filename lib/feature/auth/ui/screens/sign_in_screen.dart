import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_button.dart';
import 'package:intricate1/core/components/custom_text_field.dart';
import 'package:intricate1/core/utils/image_path.dart';
import 'package:intricate1/feature/auth/data/controller/sign_in_controller.dart';
import 'package:intricate1/feature/auth/ui/screens/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final signInController = Get.put(SignInController());

    final GlobalKey<FormState> signInKey = GlobalKey<FormState>();


    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Form(
                  key: signInKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Logo
                      Image.asset(Images.authTypeLogo, height: 200.h, width: 327),
                      const SizedBox(height: 50),

                      const Text(
                        'Continue with email',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 16),

                      RichText(
                        text: const TextSpan(
                          text: 'to continue to ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          children: [
                            TextSpan(
                              text: 'Growefx',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Email Field
                      CustomTextField(
                        labelText: 'Email ID',
                        hintText: 'Email',
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16.h),

                      // Password Field
                      CustomTextField(
                        labelText: 'Password',
                        hintText: 'Password',
                        isObscure: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: 24.h),

                      // Sign In Button
                      Obx(() {
                        return signInController.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : ComponentCustomButton(
                                text: 'Sign in',
                                gradientColors: const [
                                  Color(0xFF7eb243),
                                  Color(0xFF024015),
                                ],
                                borderRadius: 8,
                                height: 50,
                                onTap: () async {
                                  if (signInKey.currentState!.validate()) {
                                    await signInController.signIn();
                                  }

                                },
                              );
                      }),
                      const SizedBox(height: 16),

                      Text(
                        'If you don’t have any account please',
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                      const SizedBox(height: 12),

                      GestureDetector(
                        onTap: () {
                          Get.to(SignUpScreen());
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
