import 'package:flutter/material.dart';
import 'package:Retail_Application/data/enums/apz_font_weight.dart';
import 'package:Retail_Application/themes/apz_app_themes.dart';
import 'package:Retail_Application/themes/common_properties.dart';

class ApzText extends StatelessWidget {
  final String label;
  final ApzFontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  
const ApzText({
  super.key,
  required this.label,  
  this.fontWeight,
  this.fontSize,
  this.color,
});

  @override
  Widget build(BuildContext context) {
    // Determine the final font weight. Use bodyRegular as a sensible default.
    final FontWeight finalFontWeight =
        (fontWeight ?? ApzFontWeight.bodyRegular).value;

    // Determine the final font size, falling back to the one in common_properties.
    final double finalFontSize = fontSize ?? defaultFontSize;

    // Determine the final color, falling back to the primary text color from the theme.
    final Color finalColor = color ?? AppColors.primary_text(context);

    return Text(
      label,
      style: TextStyle(
        color: finalColor,
        fontSize: finalFontSize,
        fontWeight: finalFontWeight,
      ),
    );
  }
}
