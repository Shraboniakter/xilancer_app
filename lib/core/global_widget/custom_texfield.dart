

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final int? min;
  final int? max;

  final bool? colorTrue;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final bool? enable;
  final Icon? icon;

  const CustomTextfield({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.textInputAction,
    this.onChanged,
    this.min,
    this.max,
    this.colorTrue,
    this.suffix,
    this.prefix,
    this.validator,
    this.enable,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: max,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.poppins(fontSize: 16.sp, color: Color(0xff3B4759),
            fontWeight: FontWeight.w400),
        hintText: hintText,
        prefixIcon: prefix ?? icon,
        filled: true,

        fillColor: const Color(0xFFFFFFFF),
        suffixIcon: suffix ?? icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Color(0xFFFFFFFF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color:Color(0xFFFFFFFF) ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}