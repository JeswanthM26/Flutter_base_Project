import 'package:flutter/material.dart';
import 'package:Retail_Application/data/enums/apz_font_weight.dart';
import 'package:Retail_Application/themes/apz_app_themes.dart';
import 'package:Retail_Application/themes/common_properties.dart';

<<<<<<< HEAD
// class CustomText extends StatelessWidget {
//   final String text;
//   final ApzFontWeight? fontWeight;
//   final double? fontSize;
//   final Color? color;

//   const CustomText(
//     this.text, {
//     super.key,
//     this.fontWeight,
//     this.fontSize,
//     this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Determine the final font weight. Use bodyRegular as a sensible default.
//     final FontWeight finalFontWeight =
//         (fontWeight ?? ApzFontWeight.bodyRegular).value;

//     // Determine the final font size.
//     final double finalFontSize = fontSize ?? CommonProperties.defaultFontSize;

//     // Determine the final color.
//     final Color finalColor = color ?? AppColors.primary_text(context);

//     return Text(
//       text,
//       style: TextStyle(
//         color: finalColor,
//         fontSize: finalFontSize,
//         fontWeight: finalFontWeight,
//       ),
//     );
//   }
// }


class CustomText extends StatelessWidget {
  final String label;  // Renamed from text to label
=======
class CustomText extends StatelessWidget {
  final String label; // Renamed from text to label
>>>>>>> b0d715b80c39b6d287cacac173e1614bc8e2965b
  final ApzFontWeight? fontWeight;
  final double? fontSize;
  final Color? color;

  const CustomText({
    super.key,
<<<<<<< HEAD
    required this.label,  // required named parameter
=======
    // required named parameter
    required this.label,
>>>>>>> b0d715b80c39b6d287cacac173e1614bc8e2965b
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
<<<<<<< HEAD
      label,  // use label instead of text
=======
      label, // use label instead of text
>>>>>>> b0d715b80c39b6d287cacac173e1614bc8e2965b
      style: TextStyle(
        color: finalColor,
        fontSize: finalFontSize,
        fontWeight: finalFontWeight,
      ),
    );
  }
}
