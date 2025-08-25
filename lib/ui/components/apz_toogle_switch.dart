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
