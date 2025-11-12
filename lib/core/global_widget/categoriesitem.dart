import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xilancer_app/core/global_widget/custom_text.dart';

class CategoriesItem extends StatelessWidget {
  final String imagePath; // 🔹 image path dynamic
  final String title; // 🔹 title dynamic
  final double? height; // optional height
  final double? width;  // optional width

  const CategoriesItem({
    super.key,
    required this.imagePath,
    required this.title,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height ?? 94.h, // default 94.h if not provided
          width: width ?? 106.w,  // default 106.w if not provided
          child: Card(
            elevation: 0,
            color: const Color(0xffFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    imagePath, // ✅ dynamic image
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextPoppins(
                    text: title, // ✅ dynamic text
                    size: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
