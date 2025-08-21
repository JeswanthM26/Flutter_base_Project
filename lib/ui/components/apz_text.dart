import 'package:flutter/material.dart';
import 'package:Retail_Application/data/enums/apz_font_weight.dart';
import 'package:Retail_Application/themes/apz_app_themes.dart';
import 'package:Retail_Application/themes/common_properties.dart';

class CustomText extends StatelessWidget {
  final String label; // Renamed from text to label
  final ApzFontWeight? fontWeight;
  final double? fontSize;
  final Color? color;

  const CustomText({
    super.key,
    // required named parameter
    required this.label,
    this.fontWeight,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final FontWeight finalFontWeight =
        (fontWeight ?? ApzFontWeight.bodyRegular).value;

    final double finalFontSize = fontSize ?? 14.0;

    final Color finalColor = color ?? AppColors.primary_text(context);

    return Text(
      label, // use label instead of text
      style: TextStyle(
        color: finalColor,
        fontSize: finalFontSize,
        fontWeight: finalFontWeight,
      ),
    );
  }
}
