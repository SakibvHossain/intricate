import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssessmentProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback? onBackPressed;

  const AssessmentProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (currentStep >= 2)
                GestureDetector(
                  onTap: onBackPressed,
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new_outlined, size: 16.sp),
                      SizedBox(width: 5.w),
                      Text(
                        'Back',
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      ),
                    ],
                  ),
                )
              else
                const SizedBox(width: 0),
              Text(
                'Step $currentStep out of $totalSteps',
                style: TextStyle(fontSize: 13.sp, color: const Color(0xFF5F6CAF)),
              ),
            ],
          ),
          SizedBox(height: 30.h),

          Container(
            height: 16.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: (currentStep - 1) / totalSteps,
                      end: currentStep / totalSteps,
                    ),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    builder: (context, value, child) {
                      return LinearProgressIndicator(
                        value: value,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF5F6CAF),
                        ),
                        minHeight: 8.h,
                        borderRadius: BorderRadius.circular(20.r),
                      );
                    },
                  ),
                ),

                TweenAnimationBuilder(
                  tween: Tween<double>(
                    begin: (currentStep - 1) / totalSteps,
                    end: currentStep / totalSteps,
                  ),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  builder: (context, value, child) {
                    debugPrint("+++++++++++++Current Step++++++++++++++++$currentStep");
                    return Positioned(
                      left: MediaQuery.of(context).size.width * value - updateValue(currentStep).w,
                      bottom: -5.h,
                      top: -5.h,
                      child: Image.asset(
                        'assets/onboarding/images/progress.png',
                        width: 82.w,
                        height: 82.h,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int updateValue(int value){
    if(value == 1){
      return 55;
    }else if(value == 2){
      return 55;
    }else if(value == 3){
      return 65;
    } else if(value == 4 || value == 5){
      return 68;
    }else{
      return 55;
    }
  }
}
