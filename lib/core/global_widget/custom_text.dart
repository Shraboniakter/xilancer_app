import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
class CustomTextPoppins extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final OnTap? onTap;
  const CustomTextPoppins({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.textAlign, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,

      ),
    );
  }
}