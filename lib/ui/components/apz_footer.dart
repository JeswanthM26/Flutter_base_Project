
import 'package:Retail_Application/themes/apz_app_themes.dart';
import 'package:Retail_Application/themes/common_properties.dart';
import 'package:flutter/material.dart';

class FooterBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  //final List<Widget> pages;

  const FooterBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected, required Null Function() onCenterTap,
  //  required this.pages,
  }) : super(key: key);
  //assert(pages.length == 5, 'Pass exactly 5 pages'),
       

  // void _handleTap(BuildContext context, int index) {
  //   if (index == selectedIndex) return;
  //   onItemSelected(index);

  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (_) => pages[index]),
  //   );
  // }

  Widget _buildTabItem({
    required BuildContext context,
    required IconData iconData,
    required String label,
    required bool isSelected,
    required int index,
  }) {
    final color = isSelected
        ? AppColors.footer_selected(context)
        : AppColors.footer_default(context);
    return Expanded(
      child: InkWell(
        onTap: () => onItemSelected(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData, color: color, size: footer_iconSize),
            const SizedBox(height: footer_spacing),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: footer_labelFontSize,
                fontWeight: footer_labelFontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton(BuildContext context, int index) {
    return Container(
      width: footer_centerButtonSize,
      height: footer_centerButtonSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF60AFFF), Color(0xFF2580C5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onItemSelected(index),
          borderRadius: BorderRadius.circular(footer_centerButtonSize / 2),
          child: const Center(
            child: Icon(
              Icons.ac_unit, // Replace with your custom icon or SVG
              color: Colors.white,
              size: footer_centerIconSize,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: footer_height,
      padding: footer_padding,
      decoration: BoxDecoration(
        color: AppColors.footer_background(context),
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(footer_borderRadius)),
      
       border: Border(
          top: BorderSide(
            color: AppColors.footer_default(context),
            width: footer_borderWidth,
          ),
        ),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTabItem(
            context: context,
            iconData: Icons.home_outlined,
            label: 'Home',
            isSelected: selectedIndex == 0,
            index: 0,
          ),
          _buildTabItem(
            context: context,
            iconData: Icons.person_outline,
            label: 'Accounts',
            isSelected: selectedIndex == 1,
            index: 1,
          ),
          _buildCenterButton(context, 2),
          _buildTabItem(
            context: context,
            iconData: Icons.credit_card_outlined,
            label: 'Cards',
            isSelected: selectedIndex == 3,
            index: 3,
          ),
          _buildTabItem(
            context: context,
            iconData: Icons.pie_chart_outline,
            label: 'Spends',
            isSelected: selectedIndex == 4,
            index: 4,
          ),
        ],
      ),
    );
  }
}