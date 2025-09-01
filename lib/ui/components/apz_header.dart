// import 'package:Retail_Application/ui/components/apz_searchbar.dart';
// import 'package:flutter/material.dart';

// class ApzHeader extends StatelessWidget {
//   const ApzHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // 1. Leading Icon
//           Container(
//             width: 44,
//             height: 44,
//             decoration: ShapeDecoration(
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               shadows: const [
//                 BoxShadow(
//                   color: Color(0x0A4F74E3),
//                   blurRadius: 4,
//                   offset: Offset(2, -2),
//                   spreadRadius: 0,
//                 )
//               ],
//             ),
//             child: const Stack(), // Placeholder for an icon
//           ),
//           const SizedBox(width: 12),

//           // 2. Search bar
//           const Expanded(
//             child: ApzSearchBar(
//               type: AppzSearchBarType.primary,
//               placeholder: 'Search..',
//             ),
//           ),
//           const SizedBox(width: 12),

//           // 3. Notification Icon
//           const Icon(
//             Icons.notifications_none,
//             size: 28,
//           ),
//           const SizedBox(width: 12),

//           // 4. Profile Icon
//           Container(
//             width: 40,
//             height: 40,
//             decoration: ShapeDecoration(
//               image: const DecorationImage(
//                 image: AssetImage('assets/images/icon.jpg'),
//                 fit: BoxFit.cover,
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:Retail_Application/ui/components/apz_searchbar.dart';
import 'package:flutter/material.dart';

class ApzHeader extends StatelessWidget {
  final bool hasNotification;
  final String avatarUrl;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onSearchTap;

  const ApzHeader({
    super.key,
    this.hasNotification = false,
    this.avatarUrl = "https://placehold.co/40x40",
    this.onProfileTap,
    this.onNotificationTap,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Leading Icon (Logo)
          Container(
            width: 44,
            height: 44,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x0A4F74E3),
                  blurRadius: 4,
                  offset: Offset(2, -2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Image(image: AssetImage('assets/images/Icon.png')), // Replace with your app icon
          ),
          const SizedBox(width: 12),

          // 2. Search Bar (Reusable)
          Expanded(
            child: GestureDetector(
              onTap: onSearchTap,
              child: ApzSearchBar(
                type: AppzSearchBarType.primary,
                placeholder: 'Search..',
                 trailingIcon: const Icon(Icons.mic),
              onTrailingPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mic icon pressed')),
                );
              },
              ),
            ),
          ),
          const SizedBox(width: 12),

          // 3. Notification Icon with Red Dot
          GestureDetector(
            onTap: onNotificationTap,
            child: Stack(
              children: [
                const Icon(
                  Icons.notifications_none,
                  size: 28,
                ),
                if (hasNotification)
                  Positioned(
                    right: 0,
                    top: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // 4. Profile Icon (Circular, Clickable)
          GestureDetector(
  onTap: onProfileTap,
  child: Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.grey[200], // Placeholder background
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Icon(Icons.person, size: 28, color: Colors.black54),
  ),
),
        ],
      ),
    );
  }
}
