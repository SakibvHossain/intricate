import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intricate1/app_icons.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/feature/home/data/controller/nav_controller.dart';
import 'package:intricate1/feature/home/ui/screens/bottom_nav_screen.dart';
import 'package:intricate1/feature/home/ui/screens/home_page.dart';
import 'package:intricate1/feature/home/ui/screens/timer_page.dart';
import 'package:intricate1/feature/home/ui/widgets/custom_button.dart';
import 'package:intricate1/feature/home/ui/widgets/custom_task.dart';
import 'package:intricate1/feature/home/ui/widgets/fl_chart_bar.dart';
import 'package:intricate1/feature/notes/ui/screens/note_page.dart';
import 'package:intricate1/feature/profile/ui/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final navbarController = Get.put(NavbarController());
  @override
  Widget build(BuildContext context) {

    NavbarController.to.show();
    return   CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white.withAlpha(4),
          title: const Text('Growefx', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () =>  Get.to(const ProfileScreen()),
                child: const CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/profile/image/profile.png'),
                  
                ),
              ),
            )
            ],
          ), 
        body: SafeArea(
          child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Text('Communication Plan', style: TextStyle(fontSize: 30, color: Colors.white),),
                SizedBox(height: 16.h,),
                 const FlowChartWidget(),
                 SizedBox(height: 16.h,),
                const Text('Todays Task', style: TextStyle(fontSize: 30, color: Colors.white),),
                 SizedBox(height: 16.h,),
                 TodaysTaskWidget(
                 title: '5-minute breathing exercise', 
                 time: '2.00', 
                 child: CustomButtonWidget(text: 'Start Now', iconpath: AppIcons.clock_icon, onTap: (){
                   Get.to(const TimerPage());
                 }),
                  ),
                  SizedBox(height: 16.h,),
                   TodaysTaskWidget(
                 title: 'How to Calm Your Morning', 
                 time: '7.00', 
                 child: CustomButtonWidget(text: 'Watch Video', iconpath: AppIcons.video_icon, onTap: (){
                   Get.to( HomePage());
                 }),
                // child: CustomButton1(
                //   onPressed: () {
                    
                //   },
                //   text: 'Watch Video',
                //   backgroundColor: const Color(0xFF008000),prefixIconPath: AppIcons.video_icon,
                //   prefixIconHeight: 20.h,
                //   prefixIconWidth: 20.w,
                  
                // ),
                  ),
                  SizedBox(height: 16.h,),
                   TodaysTaskWidget(
                 title: 'List 3 things that made you smile this week', 
                 time: '5.00', 
                 child: CustomButtonWidget(text: 'Write your thing', iconpath: AppIcons.note_pad_icon, onTap: (){
                   Get.to( NotePage());
                 }),
                  ),
                  SizedBox(height: 16.h,),
                  
            
            
              ],
            ),
          ),
          ),
          
          )
      ),
    );
  }
}
