import 'package:Retail_Application/themes/apz_app_themes.dart';
import 'package:Retail_Application/themes/common_properties.dart';
import 'package:Retail_Application/ui/components/apz_button.dart';
import 'package:Retail_Application/ui/components/apz_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 

enum ApzAlertMessageType { success, error, info, warning }

enum ApzAlertType { primary, secondary, tertiary }

class ApzAlert extends StatefulWidget {
  final String title;
  final String message;
  final ApzAlertMessageType messageType;
  final ApzAlertType alertType;
  final List<String> buttons;
  final Function(String)? onButtonPressed;

  const ApzAlert({
    Key? key,
    required this.title,
    required this.message,
    required this.messageType,
    required this.alertType,
    this.buttons = const ['Okay'],
    this.onButtonPressed,
  }) : super(key: key);

  @override
  _AppzAlertState createState() => _AppzAlertState();
}

class _AppzAlertState extends State<ApzAlert> {
  String _getIconPath() {
    switch (widget.messageType) {
      case ApzAlertMessageType.success:
        return 'assets/alerts/Success.svg';
      case ApzAlertMessageType.error:
        return 'assets/alerts/Error.svg';
      case ApzAlertMessageType.info:
        return 'assets/alerts/Info.svg';
      case ApzAlertMessageType.warning:
        return 'assets/alerts/Alert.svg';
    }
  }

  // ignore: unused_element
  ApzButtonAppearance _getButtonAppearance(
      ApzAlertType type, int buttonIndex) {
    switch (type) {
      case ApzAlertType.primary:
        return buttonIndex == 0
            ? ApzButtonAppearance.primary
            : ApzButtonAppearance.secondary;
      case ApzAlertType.secondary:
        return ApzButtonAppearance.secondary;
      case ApzAlertType.tertiary:
        return buttonIndex == 0
            ? ApzButtonAppearance.primary
            : ApzButtonAppearance.secondary;
    }
  }

  Widget _buildButtonRow() {
    if (widget.alertType == ApzAlertType.primary) {
      // primary and secondary buttons side by side
      return Row(
        children: [
          Expanded(
            child: ApzButton(
              label: widget.buttons.isNotEmpty ? widget.buttons[0] : 'OK',
              appearance: ApzButtonAppearance.primary,
              size: ApzButtonSize.large,
              onPressed: () {
                Navigator.of(context).pop();
                if (widget.buttons.isNotEmpty)
                  widget.onButtonPressed?.call(widget.buttons[0]);
              },
            ),
          ),
          if (widget.buttons.length > 1) SizedBox(width: alert_buttonSpacing),
          if (widget.buttons.length > 1)
            Expanded(
              child: ApzButton(
                label: widget.buttons[1],
                appearance: ApzButtonAppearance.secondary,
                size: ApzButtonSize.large,
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.onButtonPressed?.call(widget.buttons[1]);
                },
              ),
            ),
        ],
      );
    } else if (widget.alertType == ApzAlertType.secondary) {
      // only secondary button present
      return Row(
        children: [
          Expanded(
            child: ApzButton(
              label: widget.buttons.isNotEmpty ? widget.buttons[0] : 'OK',
              appearance: ApzButtonAppearance.secondary,
              size: ApzButtonSize.large,
              onPressed: () {
                Navigator.of(context).pop();
                if (widget.buttons.isNotEmpty)
                  widget.onButtonPressed?.call(widget.buttons[0]);
              },
            ),
          ),
        ],
      );
    } else if (widget.alertType == ApzAlertType.tertiary) {
      // primary and secondary buttons stacked vertically one by one
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ApzButton(
            label: widget.buttons.isNotEmpty ? widget.buttons[0] : 'OK',
            appearance: ApzButtonAppearance.primary,
            size: ApzButtonSize.large,
            onPressed: () {
              Navigator.of(context).pop();
              if (widget.buttons.isNotEmpty)
                widget.onButtonPressed?.call(widget.buttons[0]);
            },
          ),
          if (widget.buttons.length > 1) SizedBox(height: alert_buttonSpacing),
          if (widget.buttons.length > 1)
            ApzButton(
              label: widget.buttons[1],
              appearance: ApzButtonAppearance.secondary,
              size: ApzButtonSize.large,
              onPressed: () {
                Navigator.of(context).pop();
                widget.onButtonPressed?.call(widget.buttons[1]);
              },
            ),
        ],
      );
    } else {
      // fallback: show first button primary
      return Row(
        children: [
          Expanded(
            child: ApzButton(
              label: widget.buttons.isNotEmpty ? widget.buttons[0] : 'OK',
              appearance: ApzButtonAppearance.primary,
              size: ApzButtonSize.large,
              onPressed: () {
                Navigator.of(context).pop();
                if (widget.buttons.isNotEmpty)
                  widget.onButtonPressed?.call(widget.buttons[0]);
              },
            ),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(alert_borderRadius),
      ),
      child: Container(
        width: alert_width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(alert_borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 24,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: alert_headerPaddingHorizontal,
            vertical: alert_headerPaddingVertical,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              SizedBox(
                height: alert_headerHeight,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ApzText(
                    label: widget.title,
                    fontWeight: ApzFontWeight.headingsBold,
                    fontSize: 16,
                    color: AppColors.primary_text(context),
                  ),
                ),
              ),
              SizedBox(height: alert_iconSpacing),
              // Content row
              Padding(
                padding: EdgeInsets.all(alert_contentPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: alert_iconContainerSize,
                      height: alert_iconContainerSize,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(alert_iconBorderRadius),
                        color: Colors.transparent,
                      ),
                      child: SvgPicture.asset(
                        _getIconPath(),
                        width: alert_iconSize,
                        height: alert_iconSize,
                      ),
                    ),
                    SizedBox(width: alert_iconSpacing),
                    Expanded(
                      child: ApzText(
                        label: widget.message,
                        fontWeight: ApzFontWeight.bodyRegular,
                        fontSize: 14,
                        color: AppColors.primary_text(context),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: alert_iconSpacing),
              // Button Row based on alert type
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: alert_buttonContainerPaddingHorizontal,
                  vertical: alert_buttonContainerPaddingVertical,
                ),
                child: _buildButtonRow(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
