// import 'package:Retail_Application/data/enums/apz_toogel_enum.dart';
// import 'package:flutter/material.dart';
// import 'package:Retail_Application/data/enums/toggle_enums.dart';
// import 'package:Retail_Application/themes/apz_app_themes.dart';
// import 'package:Retail_Application/themes/common_properties.dart';

// class ApzToggleSwitch extends StatefulWidget {
//   final bool value;
//   final ValueChanged<bool> onChanged;
//   final ApzToggleSize size;
//   final ApzToggleType type;
//   final bool isEnabled;

//   const ApzToggleSwitch({
//     Key? key,
//     required this.value,
//     required this.onChanged,
//     this.size = ApzToggleSize.medium,
//     this.type = ApzToggleType.primary,
//     this.isEnabled = true,
//   }) : super(key: key);

//   @override
//   _ApzToggleSwitchState createState() => _ApzToggleSwitchState();
// }

// class _ApzToggleSwitchState extends State<ApzToggleSwitch> {
//   @override
//   Widget build(BuildContext context) {
//     final properties = ApzToggleProperties.getProperties(widget.size);
//     final onColor = widget.type == ApzToggleType.primary
//         ? AppColors.toggle_primary_on(context)
//         : AppColors.toggle_highlight_on(context);
//     final offColor = AppColors.toggle_off(context);
//     final thumbColor = widget.isEnabled ? Colors.white : AppColors.toggle_disabled_thumb(context);

//     return GestureDetector(
//       onTap: () {
//         if (widget.isEnabled) {
//           widget.onChanged(!widget.value);
//         }
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         width: properties.width,
//         height: properties.height,
//         padding: const EdgeInsets.all(2),
//         clipBehavior: Clip.antiAlias,
//         decoration: ShapeDecoration(
//           color: widget.isEnabled ? (widget.value ? onColor : offColor) : offColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         child: AnimatedAlign(
//           duration: const Duration(milliseconds: 200),
//           alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
//           child: Container(
//             width: properties.thumbSize,
//             height: properties.thumbSize,
//             decoration: ShapeDecoration(
//               color: thumbColor,
//               shape: OvalBorder(),
//               shadows: [
//                 BoxShadow(
//                   color: Color(0x0F101828),
//                   blurRadius: 2,
//                   offset: Offset(0, 1),
//                   spreadRadius: 0,
//                 ),
//                 BoxShadow(
//                   color: Color(0x19101828),
//                   blurRadius: 3,
//                   offset: Offset(0, 1),
//                   spreadRadius: 0,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:Retail_Application/ui/components/apz_text.dart';
import 'package:flutter/material.dart';
import 'package:Retail_Application/themes/common_properties.dart';
import 'package:Retail_Application/themes/apz_app_themes.dart';

enum ApzToggleSize { small, large }

class ApzToggleController extends ChangeNotifier {
  bool _value;
  ApzToggleController(this._value);

  bool get value => _value;
  set value(bool newValue) {
    if (_value != newValue) {
      _value = newValue;
      notifyListeners();
    }
  }
}

class ApzToggleButton extends StatefulWidget {
  final String label;
  final ApzToggleController controller;
  final bool isDisabled;
  final ApzToggleSize size;
  final ValueChanged<bool>? onChanged;

  const ApzToggleButton({
    Key? key,
    required this.label,
    required this.controller,
    this.isDisabled = false,
    this.size = ApzToggleSize.small,
    this.onChanged,
  }) : super(key: key);

  @override
  State<ApzToggleButton> createState() => _ApzToggleButtonState();
}

class _ApzToggleButtonState extends State<ApzToggleButton> {
  late bool _isOn;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _isOn = widget.controller.value;
    widget.controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _controllerListener() {
    if (_isOn != widget.controller.value) {
      setState(() {
        _isOn = widget.controller.value;
      });
    }
  }

  void _toggle() {
    if (widget.isDisabled) return; // Disabled disables toggle interaction only
    final newValue = !_isOn;
    widget.controller.value = newValue;
    widget.onChanged?.call(newValue);
  }

  double get _width =>
      widget.size == ApzToggleSize.small ? toggleSmallWidth : toggleLargeWidth;
  double get _height => widget.size == ApzToggleSize.small
      ? toggleSmallHeight
      : toggleLargeHeight;
  double get _thumbSize => widget.size == ApzToggleSize.small
      ? toggleSmallThumbSize
      : toggleLargeThumbSize;

  Color _getTrackColor(BuildContext context) {
    if (widget.isDisabled) return AppColors.Toggle_disabled(context);
    if (_isOn) {
      return _isHovered
          ? AppColors.Toggle_hover(context)
          : AppColors.Toggle_default(context);
    }
    return AppColors.Toggle_disabled(context);
  }

  // Label color stays primary_text regardless of disabled state
  Color _getLabelColor(BuildContext context) {
    return AppColors.primary_text(context);
  }

  @override
  Widget build(BuildContext context) {
    final trackColor = _getTrackColor(context);
    final labelColor = _getLabelColor(context);

    return MouseRegion(
      onEnter: (_) {
        if (!widget.isDisabled) {
          setState(() {
            _isHovered = true;
          });
        }
      },
      onExit: (_) {
        if (!widget.isDisabled) {
          setState(() {
            _isHovered = false;
          });
        }
      },
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Label left, toggle right
        children: [
          Flexible(
            child: ApzText(
              label: widget.label,
              color: labelColor,
              fontWeight: ApzFontWeight.labelRegular,
              fontSize: toggleFontSize,
            ),
          ),
          GestureDetector(
            onTap: _toggle,
            behavior: HitTestBehavior.translucent,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              width: _width,
              height: _height,
              padding: EdgeInsets.all(togglePaddingHorizontal),
              decoration: BoxDecoration(
                color: trackColor,
                borderRadius: BorderRadius.circular(_height / 2),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: _thumbSize,
                  height: _thumbSize,
                  decoration: BoxDecoration(
                    color: AppColors.inverse_text(context),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
