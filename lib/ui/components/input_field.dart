// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_foundations/components/input/appz_input_field_enums.dart';
// import 'package:flutter_foundations/components/input/appz_input_field_logic.dart';
// import 'package:flutter_foundations/components/input/appz_input_field_theme.dart';

// class AppzInputField extends StatefulWidget {
//   final AppzInputFieldAppearance appearance;
//   final AppzInputLabelPosition labelPosition;
//   final AppzInputType inputType;
//   final AppzInputValidationType validationType;
//   final String? label;
//   final String? hintText;
//   final TextEditingController? controller;
//   final bool disabled;
//   final bool obscureText;
//   final String? errorText;
//   final FormFieldValidator<String>? validator;

//   const AppzInputField({
//     Key? key,
//     this.appearance = AppzInputFieldAppearance.primary,
//     this.labelPosition = AppzInputLabelPosition.top,
//     this.inputType = AppzInputType.text,
//     this.validationType = AppzInputValidationType.none,
//     this.obscureText = false,
//     this.label,
//     this.hintText,
//     this.controller,
//     this.disabled = false,
//     this.errorText,
//     this.validator,
//   }) : super(key: key);

//   @override
//   _AppzInputFieldState createState() => _AppzInputFieldState();
// }

// class _AppzInputFieldState extends State<AppzInputField> {
//   final FocusNode _focusNode = FocusNode();
//   bool _isFocused = false;
//   String? _error;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(_onFocusChange);
//     _error = widget.errorText;
//   }

//   void _onFocusChange() {
//     setState(() {
//       _isFocused = _focusNode.hasFocus;
//     });
//   }

//   @override
//   void dispose() {
//     _focusNode.removeListener(_onFocusChange);
//     _focusNode.dispose();
//     super.dispose();
//   }
  
//   AppzInputFieldState get _currentState {
//     if (widget.disabled) return AppzInputFieldState.disabled;
//     if (_error != null) return AppzInputFieldState.error;
//     if (_isFocused) return AppzInputFieldState.focused;
//     return AppzInputFieldState.defaultState;
//   }

//   AppzInputFieldStyle? _resolveStyle(BuildContext context) {
//     final theme = Theme.of(context).extension<AppzInputFieldTheme>();
//     if (theme == null) return null;

//     AppzInputFieldAppearanceTheme? appearanceTheme;
//     switch (widget.appearance) {
//       case AppzInputFieldAppearance.primary:
//         appearanceTheme = theme.primary;
//         break;
//       case AppzInputFieldAppearance.secondary:
//         appearanceTheme = theme.secondary;
//         break;
//       case AppzInputFieldAppearance.filled:
//         appearanceTheme = theme.filled;
//         break;
//     }
//     if (appearanceTheme == null) return null;
    
//     switch (_currentState) {
//       case AppzInputFieldState.defaultState:
//         return appearanceTheme.defaultState;
//       case AppzInputFieldState.focused:
//         return appearanceTheme.focused;
//       case AppzInputFieldState.error:
//         return appearanceTheme.error;
//       case AppzInputFieldState.disabled:
//         return appearanceTheme.disabled;
//       case AppzInputFieldState.success:
//         return appearanceTheme.success;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final style = _resolveStyle(context);
    
//     if (style == null) {
//       // Fallback to a basic text field if the theme is not defined
//       return TextFormField(
//         controller: widget.controller,
//         focusNode: _focusNode,
//         decoration: InputDecoration(
//           labelText: widget.label,
//           hintText: widget.hintText,
//           errorText: _error,
//         ),
//       );
//     }

//     final inputDecoration = InputDecoration(
//       hintText: widget.hintText,
//       hintStyle: style.hintStyle,
//       errorText: _error,
//       errorStyle: style.labelStyle?.copyWith(color: style.borderColor), // Using labelStyle for error as well
//       border: InputBorder.none,
//       filled: true,
//       fillColor: Colors.transparent, // The container handles the fill color
//       contentPadding: EdgeInsets.zero,
//     );

//     final textFormField = TextFormField(
//       controller: widget.controller,
//       focusNode: _focusNode,
//       style: style.textStyle,
//       enabled: !widget.disabled,
//       decoration: inputDecoration,
//       keyboardType: AppzInputFieldLogic.getKeyboardType(widget.inputType),
//       inputFormatters: AppzInputFieldLogic.getInputFormatters(widget.inputType),
//       obscureText: AppzInputFieldLogic.isObscureText(widget.inputType, obscureText: widget.obscureText),
//       validator: (value) {
//         final error = widget.validator?.call(value);
//         // Use addPostFrameCallback to avoid calling setState during a build
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (mounted) { // Check if the widget is still in the tree
//             setState(() {
//               _error = error;
//             });
//           }
//         });
//         return error;
//       },
//     );

//     final labelWidget = widget.label != null
//         ? Text(widget.label!, style: style.labelStyle)
//         : const SizedBox.shrink();

//     final fieldContainer = Container(
//       padding: style.padding,
//       decoration: BoxDecoration(
//         color: style.backgroundColor,
//         borderRadius: style.borderRadius,
//         border: Border.all(
//           color: style.borderColor ?? Colors.transparent,
//           width: style.borderWidth ?? 0,
//         ),
//         boxShadow: style.boxShadow,
//       ),
//       child: textFormField,
//     );

//     if (widget.labelPosition == AppzInputLabelPosition.top) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           labelWidget,
//           const SizedBox(height: 4),
//           fieldContainer,
//         ],
//       );
//     } else { // AppzInputLabelPosition.left
//       return Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           labelWidget,
//           const SizedBox(width: 8),
//           Expanded(child: fieldContainer),
//         ],
//       );
//     }
//   }
// }
enum AppzInputFieldAppearance {
  primary,
  secondary,
  filled,
}

enum AppzInputFieldState {
  defaultState,
  error,
  disabled,
  focused,
  success,
}

enum AppzInputLabelPosition {
  top,
  left,
}

enum AppzInputValidationType {
  none,
  mandatory,
  email,
  numeric,
  amount,
  password,
}

enum AppzInputType {
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

