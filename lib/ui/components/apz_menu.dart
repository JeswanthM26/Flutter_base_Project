// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:Retail_Application/models/apz_menu_options.dart';
// /// Bottom sheet showing a paginated grid of menu items
// class MenuSheet extends StatefulWidget {
//   final List<MenuOption> options;
//   final int itemsPerPage;
//   final int columns;

//   const MenuSheet({
//     super.key,
//     required this.options,
//     this.itemsPerPage = 9, // 3x3 grid
//     this.columns = 3,
//   });

//   @override
//   State<MenuSheet> createState() => _MenuSheetState();
// }

// class _MenuSheetState extends State<MenuSheet> {
//   final PageController _pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     final int totalPages =
//         (widget.options.length / widget.itemsPerPage).ceil();

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.surface,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       child: Column(
//         children: [
//           // handle bar
//           Container(
//             width: 40,
//             height: 4,
//             margin: const EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.grey[400],
//               borderRadius: BorderRadius.circular(2),
//             ),
//           ),

//           // grid pages
//           Expanded(
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: totalPages,
//               itemBuilder: (context, pageIndex) {
//                 final start = pageIndex * widget.itemsPerPage;
//                 final end = (start + widget.itemsPerPage).clamp(
//                   0,
//                   widget.options.length,
//                 );
//                 final pageItems = widget.options.sublist(start, end);

//                 return GridView.count(
//                   physics: const NeverScrollableScrollPhysics(),
//                   crossAxisCount: widget.columns,
//                   children: pageItems.map((opt) {
//                     return _MenuItem(option: opt);
//                   }).toList(),
//                 );
//               },
//             ),
//           ),

//           // page indicator
//           if (totalPages > 1) ...[
//             const SizedBox(height: 12),
//             SmoothPageIndicator(
//               controller: _pageController,
//               count: totalPages,
//               effect: ExpandingDotsEffect(
//                 dotHeight: 6,
//                 dotWidth: 6,
//                 activeDotColor: Theme.of(context).colorScheme.primary,
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

// /// individual menu item
// class _MenuItem extends StatelessWidget {
//   final MenuOption option;

//   const _MenuItem({required this.option});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: option.onTap,
//       borderRadius: BorderRadius.circular(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             backgroundColor:
//                 Theme.of(context).colorScheme.primary.withOpacity(0.1),
//             radius: 28,
//             child: Icon(option.icon,
//                 color: Theme.of(context).colorScheme.primary, size: 28),
//           ),
//           const SizedBox(height: 8),
//           Text(option.label, style: Theme.of(context).textTheme.bodySmall),
//         ],
//       ),
//     );
//   }
// }
// lib/ui/components/menu_sheet.dart
// lib/ui/components/menu_sheet.dart
import 'package:flutter/material.dart';
import 'package:Retail_Application/models/apz_menu_options.dart';
import 'package:Retail_Application/ui/components/apz_menu_item.dart';

class MenuSheet extends StatelessWidget {
  const MenuSheet({Key? key, required List<MenuOption> options}) : super(key: key);

  List<MenuOption> _getMenuOptions(BuildContext context) {
    return [
      MenuOption(
        label: 'Promotions',
        icon: Icons.local_offer_outlined,
        onTap: () {
          Navigator.pop(context);
          // your logic
        },
      ),
      MenuOption(
        label: 'Payments',
        icon: Icons.payment,
        onTap: () {},
      ),
      MenuOption(
        label: 'Rewards',
        icon: Icons.card_giftcard,
        onTap: () {},
      ),
      MenuOption(
        label: 'Transfers',
        icon: Icons.swap_horiz,
        onTap: () {},
      ),
      MenuOption(
        label: 'Settings',
        icon: Icons.settings,
        onTap: () {},
      ),
      MenuOption(
        label: 'Payments',
        icon: Icons.payment,
        onTap: () {},
      ),
      MenuOption(
        label: 'Rewards',
        icon: Icons.card_giftcard,
        onTap: () {},
      ),
      MenuOption(
        label: 'Transfers',
        icon: Icons.swap_horiz,
        onTap: () {},
      ),
      MenuOption(
        label: 'Settings',
        icon: Icons.settings,
        onTap: () {},
      ),
      MenuOption(
        label: 'Payments',
        icon: Icons.payment,
        onTap: () {},
      ),
      MenuOption(
        label: 'Rewards',
        icon: Icons.card_giftcard,
        onTap: () {},
      ),
      MenuOption(
        label: 'Transfers',
        icon: Icons.swap_horiz,
        onTap: () {},
      ),
      MenuOption(
        label: 'Settings',
        icon: Icons.settings,
        onTap: () {},
      ),
      // 👉 add as many as you want
    ];
  }

  @override
  Widget build(BuildContext context) {
    final options = _getMenuOptions(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.9,
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          return MenuItemCard(
            label: option.label,
            icon: option.icon,
            onTap: option.onTap,
          );
        },
      ),
    );
  }
}
