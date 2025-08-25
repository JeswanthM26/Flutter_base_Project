import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:Retail_Application/data/enums/apz_input_field_enums.dart';
import 'package:Retail_Application/themes/apz_app_themes.dart';
import 'package:Retail_Application/themes/common_properties.dart';

class ApzInputField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enabled;
  final bool isEmailFld;
  final bool isAmount;
  final AmountFormatType? amountFormatType;
  final bool allowAllCaps;
  final bool isMandatory;
  final bool onlyNumbers;

  const ApzInputField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.isEmailFld = false,
    this.isAmount = false,
    this.amountFormatType,
    this.allowAllCaps = false,
    this.isMandatory = false,
    this.onlyNumbers = false,
  });

  @override
  State<ApzInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<ApzInputField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  String? _validate(String? value) {
    if (widget.validator != null) return widget.validator!(value);

    if (widget.isMandatory && (value == null || value.trim().isEmpty)) {
      return 'This field is required';
    }

    if (widget.isEmailFld) {
      final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
      if (value == null || value.trim().isEmpty) return 'Email is required';
      if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    }

    return null;
  }

  List<TextInputFormatter> _buildInputFormatters() {
    final formatters = <TextInputFormatter>[];

    if (widget.isAmount) {
      // The custom formatter now handles all logic, no need for FilteringTextInputFormatter
      formatters.add(_ThousandsSeparatorInputFormatter(widget.amountFormatType));
    } else if (widget.onlyNumbers) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    if (widget.allowAllCaps) {
      formatters.add(UpperCaseTextFormatter());
    }

    return formatters;
  }

  Widget? _buildSuffixIcon() {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _isObscured ? Icons.visibility_off : Icons.visibility,
          color: AppColors.primary_text(context),
        ),
        onPressed: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
      );
    }
    return widget.suffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    final borderShape = OutlineInputBorder(
      borderRadius: BorderRadius.circular(inputFieldBorderRadius),
      borderSide: BorderSide.none,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.label,
            style: inputFieldLabelStyle.copyWith(
              color: AppColors.secondary_text(context),
            ),
            children: widget.isMandatory
                ? [
                    TextSpan(
                      text: ' *',
                      style: inputFieldLabelStyle.copyWith(
                        color: AppColors.semantic_error(context),
                      ),
                    ),
                  ]
                : [],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: _isObscured,
          keyboardType: widget.isAmount || widget.onlyNumbers
              ? const TextInputType.numberWithOptions(decimal: true)
              : widget.keyboardType,
          validator: _validate,
          enabled: widget.enabled,
          inputFormatters: _buildInputFormatters(),
          style: inputFieldHintStyle.copyWith(
              color: AppColors.primary_text(context),
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: widget.hintText ?? '',
            hintStyle: inputFieldHintStyle.copyWith(
              color: AppColors.secondary_text(context),
            ),
            filled: true,
            fillColor: AppColors.input_field_filled(context),
            contentPadding: inputFieldContentPadding,
            border: borderShape,
            enabledBorder: borderShape,
            disabledBorder: borderShape,
            errorBorder: borderShape,
            focusedBorder: borderShape.copyWith(
              borderSide: BorderSide(
                color: AppColors.primary(context),
                width: 1.5,
              ),
            ),
            focusedErrorBorder: borderShape.copyWith(
              borderSide: BorderSide(
                color: AppColors.semantic_error(context),
                width: 1.5,
              ),
            ),
            suffixIcon: _buildSuffixIcon(),
            prefixIcon: widget.prefixIcon,
          ),
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
class _ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final AmountFormatType? formatType;

  _ThousandsSeparatorInputFormatter(this.formatType);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value is empty, return it as is.
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Clean the text of any existing commas to parse it.
    String cleanText = newValue.text.replaceAll(',', '');

    // Allow the user to clear the field.
    if (cleanText.isEmpty) {
      return const TextEditingValue();
    }
    
    // Use a regex to allow only numbers and a single decimal point
    final regExp = RegExp(r'^\d*\.?\d*$');
    if (!regExp.hasMatch(cleanText)) {
      return oldValue;
    }

    // Split into integer and decimal parts based on the decimal point.
    List<String> parts = cleanText.split('.');
    String integerPart = parts[0];
    String? decimalPart = parts.length > 1 ? parts[1] : null;

    // Use a BigInt for the integer part to handle large numbers.
    final BigInt? integerValue = BigInt.tryParse(integerPart);
    if (integerValue == null) {
      // This can happen if integerPart is empty, which is valid if user starts with "."
      if (integerPart.isEmpty && decimalPart != null) {
         return TextEditingValue(
            text: '.$decimalPart',
            selection: newValue.selection,
          );
      }
      return oldValue;
    }

    // Choose the number format based on the type.
    NumberFormat formatter;
    if (formatType == AmountFormatType.lakhs) {
      formatter = NumberFormat('##,##,##0', 'en_IN');
    } else {
      formatter = NumberFormat('###,###,##0', 'en_US');
    }

    // Format the integer part.
    String formattedIntegerPart = formatter.format(integerValue);

    // Reconstruct the final text.
    String newFormattedText;
    if (decimalPart != null) {
      newFormattedText = '$formattedIntegerPart.$decimalPart';
    } else {
      newFormattedText = formattedIntegerPart;
      // If the user just typed a decimal point, add it back.
      if (newValue.text.endsWith('.') && !oldValue.text.endsWith('.')) {
        newFormattedText += '.';
      }
    }
    
    // Calculate the new cursor position to be user-friendly.
    int selectionIndex = newValue.selection.end + (newFormattedText.length - newValue.text.length);
    selectionIndex = max(0, min(selectionIndex, newFormattedText.length));

    return TextEditingValue(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

// class _ThousandsSeparatorInputFormatter extends TextInputFormatter {
//   final AmountFormatType? formatType;

//   _ThousandsSeparatorInputFormatter(this.formatType);

//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     // If the new value is empty, allow it.
//     if (newValue.text.isEmpty) {
//       return newValue.copyWith(text: '');
//     }

//     // Clean the text of all non-digit characters, except the decimal point.
//     String cleanText = newValue.text.replaceAll(RegExp(r'[^\d.]'), '');

//     // Prevent multiple decimal points
//     if (cleanText.split('.').length > 2) {
//       return oldValue;
//     }

//     // Split into integer and decimal parts
//     String integerPart = cleanText;
//     String? decimalPart;
//     if (cleanText.contains('.')) {
//       final parts = cleanText.split('.');
//       integerPart = parts[0];
//       decimalPart = parts.length > 1 ? parts[1] : null;
//     }
    
//     // Format the integer part
//     if (integerPart.isNotEmpty) {
//       NumberFormat formatter;
//       if (formatType == AmountFormatType.lakhs) {
//         formatter = NumberFormat('##,##,##0', 'en_IN');
//       } else { // Default to millions
//         formatter = NumberFormat('#,##0', 'en_US');
//       }
//       String formattedInteger = formatter.format(BigInt.parse(integerPart));

//       // Reconstruct the text
//       String newText = formattedInteger;
//       if (decimalPart != null) {
//         // Limit the decimal part to 2 digits
//         newText += '.${decimalPart.substring(0, min(decimalPart.length, 2))}';
//       }
      
//       // Calculate the new cursor position
//       int selectionIndex = newText.length - (newValue.text.length - newValue.selection.end);
//       selectionIndex = max(0, selectionIndex);


//       return TextEditingValue(
//         text: newText,
//         selection: TextSelection.collapsed(offset: selectionIndex),
//       );
//     }

//     return newValue;
//   }
// }