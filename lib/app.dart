import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intricate1/core/binding/binding.dart';
import 'package:intricate1/routes/app_pages.dart';
import 'package:intricate1/routes/app_routes.dart';

class Intricate extends StatelessWidget {
  const Intricate({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Intricate',

          initialRoute: AppRoute.brandYou,
          getPages: AppPages.routes,
          initialBinding: AppBinding(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
        );
      },
    );
  }
}
