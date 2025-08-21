import 'package:Retail_Application/data/enums/apz_buttons_enum.dart';
import 'package:flutter/material.dart';

const double buttonCornerRadius = 20.0;

const EdgeInsets buttonPadding =
    EdgeInsets.symmetric(vertical: 12, horizontal: 20);

const Map<AppzButtonSize, double> buttonHeights = {
  AppzButtonSize.small: 36.0,
  AppzButtonSize.large: 44.0,
};

const Map<AppzButtonSize, double> buttonFontSizes = {
  AppzButtonSize.small: 12.0,
  AppzButtonSize.large: 15.0,
};

const Offset buttonShadowOffset1 = Offset(0, 2);
const double buttonShadowBlurRadius1 = 4;
const double buttonShadowSpreadRadius1 = 0;

const Offset buttonShadowOffset2 = Offset(0, 8);
const double buttonShadowBlurRadius2 = 16;
const double buttonShadowSpreadRadius2 = 0;

const double defaultFontSize = 14.0;
