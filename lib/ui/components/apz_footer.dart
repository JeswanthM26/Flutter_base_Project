
import 'package:flutter/material.dart';

class FooterBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  //final List<Widget> pages;

  const FooterBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
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
    final color = isSelected ? Colors.white : const Color(0xFFB3C4DE);
    return Expanded(
      child: InkWell(
        onTap: () => onItemSelected(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton(BuildContext context, int index) {
    return Container(
      width: 60,
      height: 60,
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
          onTap: () =>onItemSelected(index),
          borderRadius: BorderRadius.circular(30),
          child: const Center(
            child: Icon(
              Icons.ac_unit, // Replace with your custom icon or SVG
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(bottom: 12, top: 12, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF282828),
        borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
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