import 'package:flutter/material.dart';

enum ApzFontWeight {
  labelRegular,
  buttonTextMedium,
  captionSemibold,
  bodyRegular,
  bodyMedium,
  titlesRegular,
  titlesSemibold,
  titlesMedium,
  headingSemibold,
  headingsMedium,
  headingsBold,
  displayHeadingExpandedRegular,
}

extension ApzFontWeightExtension on ApzFontWeight {
  FontWeight get value {
    switch (this) {
      case ApzFontWeight.labelRegular:
        return FontWeight.w400; // 400
      case ApzFontWeight.buttonTextMedium:
        return FontWeight.w500; // Mapped from 510
      case ApzFontWeight.captionSemibold:
        return FontWeight.w600; // Mapped from 590
      case ApzFontWeight.bodyRegular:
        return FontWeight.w400; // 400
      case ApzFontWeight.bodyMedium:
        return FontWeight.w500; // Mapped from 510
      case ApzFontWeight.titlesRegular:
        return FontWeight.w400; // 400
      case ApzFontWeight.titlesSemibold:
        return FontWeight.w600; // Mapped from 590
      case ApzFontWeight.titlesMedium:
        return FontWeight.w500; // Mapped from 510
      case ApzFontWeight.headingSemibold:
        return FontWeight.w600; // Mapped from 590
      case ApzFontWeight.headingsMedium:
        return FontWeight.w400; // Mapped from 410
      case ApzFontWeight.headingsBold:
        return FontWeight.w700; // 700
      case ApzFontWeight.displayHeadingExpandedRegular:
        return FontWeight.w400; // Mapped from 410
    }
  }
}
