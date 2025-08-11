import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/feature/profile/data/model/plan_info.dart';
import 'package:intricate1/feature/profile/data/model/profile_info.dart';
import 'package:intricate1/feature/profile/ui/widgets/basic_info_card.dart';
import 'package:intricate1/feature/profile/ui/widgets/basic_info_row.dart';
import 'package:intricate1/feature/profile/ui/widgets/plan_info_card.dart';
import 'package:intricate1/feature/profile/ui/widgets/profile_avatar.dart';
import 'package:intricate1/feature/profile/ui/widgets/selection_header.dart';
import 'package:intricate1/widgets/text/custom_text.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  //* Mock data for demonstration
  ProfileInfo get profile => ProfileInfo(
    name: 'Saifur Rahman',
    username: 'ux.saifur.info',
    email: 'ux.saifur.info@gmail.com',
    subscription: 'Pro Plan',
  );

  List<PlanInfo> get plans => [
    PlanInfo(title: 'Serenity Plan', completedTasks: 10, totalTasks: 20),
    PlanInfo(title: 'Momentum Plan', completedTasks: 5, totalTasks: 20),
    PlanInfo(title: 'Thrive Plan', completedTasks: 10, totalTasks: 20),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
       backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 70.h),
                //* Widget for Profile Avatar
                const ProfileAvatar(imagePath: 'assets/profile/image/profile.png'),
                CustomText(
                  text: profile.name,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffFCFCFC),
                ),
                CustomText(
                  text: '@${profile.username}',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFFCFCFC),
                ),
                SizedBox(height: 16.h),
                SectionHeader(
                  title: 'Basic Info',
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      LucideIcons.pencil,
                      color: Color(0xff00D700),
                      size: 18,
                    ),
                  ),
                ),
      
                //* Widget for displaying multiple fields as rows (Basic Info)
                BasicInfoCard(
                  infos: [
                    BasicInfoRow(label: 'Name', value: profile.name,),
                    BasicInfoRow(label: 'User Name', value: profile.username),
                    BasicInfoRow(label: 'Email Address:', value: profile.email),
                    BasicInfoRow(label: 'Subscription:', value: profile.subscription, isLink: true, linkColor: const Color(0xff00D700)),
                  ],
                ),
                SizedBox(height: 16.h),
      
                //* Widget for Section Headers with optional trailing widget (icon or button)
                const SectionHeader(title: 'Created Plan'),
                SizedBox(height: 8.h),
                //* Widget for Plan Info Card
                PlanInfoCard(plans: plans),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}