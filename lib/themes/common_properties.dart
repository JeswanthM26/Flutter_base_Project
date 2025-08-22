<<<<<<< HEAD
import 'package:flutter/material.dart';

// Typography
const double defaultFontSize = 14.0;

// Input Field
const double inputFieldBorderRadius = 8.0;
const EdgeInsets inputFieldContentPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0);

// Base TextStyles (colors will be applied in the component)
const TextStyle inputFieldHintStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 13);
const TextStyle inputFieldLabelStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 12);
=======
import 'package:Retail_Application/data/enums/apz_buttons_enum.dart';
import 'package:flutter/material.dart';

const double buttonCornerRadius = 20.0;

const Map<AppzButtonSize, EdgeInsets> buttonPaddings = {
  AppzButtonSize.small: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
  AppzButtonSize.large: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
};

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

const double checkbox_width = 20.0;
const double checkbox_height = 20.0;
const double checkbox_borderRadius = 4.0;
const double checkbox_iconSize = 16.0;
const double checkbox_borderWidth = 1.43;
const double checkbox_containerWidth = 24.5;
const double checkbox_containerHeight = 24;
const double checkbox_spacing = 8.0;
const double checkbox_label_fontSize = 14.0;
const double checkbox_subtitle_fontSize = 13.0;

const double radio_outerRadius = 10;
const double radio_innerRadius = 5;
const double radio_borderWidth = 2;
const double radio_spacing = 8;
const double radio_label_fontSize = 12;
const double radio_option_fontSize = 14;

const double alert_width = 343;
const double alert_borderRadius = 16;
const double alert_headerHeight = 56;
const double alert_headerPaddingHorizontal = 24;
const double alert_headerPaddingVertical = 16;
const double alert_contentPadding = 16;
const double alert_buttonContainerPaddingHorizontal = 20;
const double alert_buttonContainerPaddingVertical = 12;
const double alert_iconContainerSize = 56;
const double alert_iconSize = 50;
const double alert_iconSpacing = 10;
const double alert_buttonSpacing = 8;
const double alert_borderWidth = 1;
const double alert_iconBorderRadius = 999;
>>>>>>> b0d715b80c39b6d287cacac173e1614bc8e2965b
