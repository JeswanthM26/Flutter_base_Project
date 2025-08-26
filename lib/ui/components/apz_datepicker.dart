

import "package:calendar_date_picker2/calendar_date_picker2.dart";
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

enum SelectionType {
  single,

  range,
}

class ApzDatepicker {
  ApzDatepicker({
    required this.context,
    required this.minDate,
    required this.maxDate,
    this.initialDate,
    this.dialogSize,
    this.selectionType = SelectionType.single,
    this.themeColor,
    this.cancelButtonTextStyle,
    this.okButtonTextStyle,
    this.cancelButtonText,
    this.okButtonText,
    this.dateFormat,
    this.weekdayLabelTextStyle,
    this.controlsTextStyle,
  });

  final BuildContext context;

  final DateTime minDate;

  final DateTime maxDate;

  final DateTime? initialDate;

  final SelectionType selectionType;

  final Color? themeColor;

  final TextStyle? cancelButtonTextStyle;

  final TextStyle? okButtonTextStyle;

  final String? cancelButtonText;

  final String? okButtonText;

  final String? dateFormat;

  final TextStyle? weekdayLabelTextStyle;

  final TextStyle? controlsTextStyle;

  final Size? dialogSize;
}

class ApzCustomDatepicker {
  Future<List<String?>?> showCustomDate(
    final ApzDatepicker params,
  ) async {
    try {
      if (params.minDate.isAfter(params.maxDate)) {
        throw ArgumentError("minDate cannot be after maxDate");
      }
      final CalendarDatePicker2Type internalType =
          params.selectionType == SelectionType.single
              ? CalendarDatePicker2Type.single
              : CalendarDatePicker2Type.range;

      final CalendarDatePicker2WithActionButtonsConfig config =
          CalendarDatePicker2WithActionButtonsConfig(
        calendarType: internalType,
        firstDate: params.minDate,
        lastDate: params.maxDate,
        selectedDayHighlightColor: Colors.black,
        dayBorderRadius: BorderRadius.zero,
        dayBuilder: _buildDay,
        okButton: Text(
          params.okButtonText ?? "OK",
          style: params.okButtonTextStyle,
        ),
        cancelButton: Text(
          params.cancelButtonText ?? "Cancel",
          style: params.cancelButtonTextStyle,
        ),
        weekdayLabelTextStyle: params.weekdayLabelTextStyle,
        controlsTextStyle: params.controlsTextStyle,
        centerAlignModePicker: true,
        rangeBidirectional: true,
      );

      final List<DateTime?> initialValue =
          internalType == CalendarDatePicker2Type.single
              ? <DateTime>[params.initialDate ?? DateTime.now()]
              : <DateTime?>[params.initialDate, null];

      final List<DateTime?>? result = await showCalendarDatePicker2Dialog(
        context: params.context,
        config: config,
        value: initialValue,
        dialogSize: params.dialogSize ?? const Size(325, 400),
        borderRadius: BorderRadius.circular(15),
        dialogBackgroundColor: Colors.white,
      );

      if (result == null || result.isEmpty) {
        return null;
      }
      return result
          .whereType<DateTime>()
          .map(
            (final DateTime date) =>
                formatDate(date, params.dateFormat ?? "dd/MM/yyyy"),
          )
          .toList();
    } catch (e) {
      throw Exception("custom DatePicker error: $e");
    }
  }

  String formatDate(final DateTime date, final String format) {
    return DateFormat(format).format(date);
  }

  Widget? _buildDay(
      {required DateTime date,
      BoxDecoration? decoration,
      bool? isDisabled,
      bool? isSelected,
      bool? isToday,
      TextStyle? textStyle}) {
    if (isSelected == true) {
      return Container(
        width: 40,
        height: 34,
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Center(
          child: Text(
            date.day.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    return null;
  }
}
