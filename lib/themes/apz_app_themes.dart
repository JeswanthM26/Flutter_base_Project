import 'package:flutter/material.dart';
import 'package:Retail_Application/themes/light_theme.dart'as light;
import 'package:Retail_Application/themes/dark_theme.dart' as dark;
 
class AppColors {

  static Color primary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.primary
          : light.primary;
 
  static Color secondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.secondary
          : light.secondary;
 
  static Color button(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.button
          : light.button;
 
  static Color button_pressed(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.button_pressed
          : light.button_pressed;
 
  static Color button_disabled(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.button_disabled
          : light.button_disabled;
 
  static Color button_2(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.button_2
          : light.button_2;
 
  static Color icons(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.icons
          : light.icons;
 
  static Color icons_2(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.icons_2
          : light.icons_2;
 
  static Color text_button(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.text_button
          : light.text_button;
 
  static Color text_primary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.text_primary
          : light.text_primary;
 
  static Color text_inverse(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.text_inverse
          : light.text_inverse;
 
  static Color text_secondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.text_secondary
          : light.text_secondary;
 
  static Color test_tertiary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.test_tertiary
          : light.test_tertiary;
 
  static Color semantic_sucess(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.semantic_sucess
          : light.semantic_sucess;
 
  static Color semantaic_sucess_radius(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.semantaic_sucess_radius
          : light.semantaic_sucess_radius;
 
  static Color semantic_warning(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.semantic_warning
          : light.semantic_warning;
 
  static Color semantic_warning_radius(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.semantic_warning_radius
          : light.semantic_warning_radius;
 
  static Color semantic_error(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.semantic_error
          : light.semantic_error;
 
  static Color semantic_error_radius(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.semantic_error_radius
          : light.semantic_error_radius;
 
  static Color semantic_info(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.semantic_info
          : light.semantic_info;
 
  static Color semantic_info_radius(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.semantic_info_radius
          : light.semantic_info_radius;
 
  static Color input_field_default(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.input_field_default
          : light.input_field_default;
 
  static Color input_field_border(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.input_field_border
          : light.input_field_border;
 
  static Color input_feld_default_text(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.input_feld_default_text
          : light.input_feld_default_text;
 
  static Color button_text_white(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.button_text_white
          : light.button_text_white;
 
  static Color button_text_black(BuildContext context) =>

      Theme.of(context).brightness == Brightness.dark
          ? dark.button_text_black
          : light.button_text_black;
 
  static Color primary_shadow_1(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.primary_shadow_1
          : light.primary_shadow_1;
 
  static Color primary_shadow_2(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.primary_shadow_2
          : light.primary_shadow_2;
 
  static Color secondary_shadow_1(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.secondary_shadow_1
          : light.secondary_shadow_1;
 
  static Color secondary_shadow_2(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.secondary_shadow_2
          : light.secondary_shadow_2;
 
  static Color popup_shadow(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.popup_shadow
          : light.popup_shadow;
 
  static Color container_box(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? dark.container_box
          : light.container_box;

}

 