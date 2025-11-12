import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer_app/core/route/route.dart';
import 'package:xilancer_app/core/utils/app_colors.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      designSize: const Size(378, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (__,child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppRoutes().pages,
          initialRoute: AppRoutes.home_screen,
          theme: ThemeData(
            scaffoldBackgroundColor:  AppColors.whiteColor,
          ),
        );
      },
    );
  }
}
