import 'package:Retail_Application/ui/components/apz_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ApzText(
              label: widget.label,
              fontWeight: ApzFontWeight.labelRegular,
              color: AppColors.secondary_text(context),
              fontSize: 12,
            ),
            if (widget.isMandatory)
              ApzText(
                label: "*",
                fontWeight: ApzFontWeight.labelRegular,
                color: AppColors.semantic_error(context),
                fontSize: 12,
              ),
          ],
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
                color: AppColors.input_field_border(context),
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
    if (newValue.text.isEmpty) return newValue;
 
    String cleanText = newValue.text.replaceAll(',', '');
     final regExp = RegExp(r'^\d*\.?\d*$');
    if (!regExp.hasMatch(cleanText)) {
      return oldValue;
    }
 
    List<String> parts = cleanText.split('.');
    String integerPart = parts[0].isEmpty ? "0" : parts[0];
    String? decimalPart = parts.length > 1 ? parts[1] : null;
 
    if (decimalPart != null && decimalPart.length > 2) {
      decimalPart = decimalPart.substring(0, 2);
    }
 
    int? intValue = int.tryParse(integerPart);
    if (intValue == null) return oldValue;
 
    NumberFormat formatter = (formatType == AmountFormatType.lakhs)
        ? NumberFormat.decimalPattern('en_IN') // 12,34,567
        : NumberFormat.decimalPattern('en_US'); // 1,234,567
 
    String formattedInteger = formatter.format(intValue);
 
    String newText = (decimalPart != null)
        ? "$formattedInteger.${decimalPart}"
        : formattedInteger;
 
    int selectionIndex =
        newText.length - (newValue.text.length - newValue.selection.end);
    selectionIndex = selectionIndex.clamp(0, newText.length);
 
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

enum AmountFormatType {
  lakhs,
  millions,
}

enum ApzInputFieldAppearance {
  primary,
  secondary,
  filled,
}

enum ApzInputFieldState {
  defaultState,
  error,
  disabled,
  focused,
  success,
}

enum ApzInputLabelPosition {
  top,
  left,
}

enum ApzInputValidationType {
  none,
  mandatory,
  email,
  numeric,
  amount,
  password,
}

enum ApzInputType {
  text,
  multiline,
  number,
  phone,
  emailAddress,
  url,
  password,
  date,
  dateTime,
}