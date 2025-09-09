// import 'package:flutter/material.dart';
// import 'package:Retail_Application/ui/components/apz_footer.dart';
// import 'package:Retail_Application/ui/components/apz_menu.dart';
// import 'package:Retail_Application/models/apz_menu_options.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   void _openMenuSheet(BuildContext context) async {
//     await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) {
//         return SizedBox(
//           height: MediaQuery.of(context).size.height * 0.5,
//           child: MenuSheet(
//             options: [
//               MenuOption(icon: Icons.shopping_cart, label: "Cart", onTap: () {}),
//               MenuOption(icon: Icons.favorite, label: "Wishlist", onTap: () {}),
//               MenuOption(icon: Icons.settings, label: "Settings", onTap: () {}),
//               MenuOption(icon: Icons.person, label: "Profile", onTap: () {}),
//               MenuOption(icon: Icons.notifications, label: "Alerts", onTap: () {}),
//               MenuOption(icon: Icons.history, label: "History", onTap: () {}),
//               MenuOption(icon: Icons.help, label: "Help", onTap: () {}),
//               MenuOption(icon: Icons.logout, label: "Logout", onTap: () {}),
//               MenuOption(icon: Icons.info, label: "About", onTap: () {}),
//                 MenuOption(icon: Icons.history, label: "History", onTap: () {}),
//               MenuOption(icon: Icons.help, label: "Help", onTap: () {}),
//               MenuOption(icon: Icons.logout, label: "Logout", onTap: () {}),
//               MenuOption(icon: Icons.info, label: "About", onTap: () {}),
              
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text("Selected index: $_selectedIndex")),
//       bottomNavigationBar: FooterBar(
//         selectedIndex: _selectedIndex,
//         onItemSelected: (index) => setState(() => _selectedIndex = index),
//         onCenterTap: () => _openMenuSheet(context), // ✅ integration
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:Retail_Application/ui/components/apz_footer.dart';        // 👈 your footer component
import 'package:Retail_Application/ui/components/apz_menu.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("🏠 Home Page")),
    const Center(child: Text("👤 Accounts Page")),
    const Center(child: Text("⚡ Menu Placeholder")), // replaced by MenuSheet
    const Center(child: Text("💳 Cards Page")),
    const Center(child: Text("📊 Spends Page")),
  ];

  void _onItemSelected(int index) {
    if (index == 2) {
      // 👇 Open MenuSheet instead of switching page
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => const MenuSheet(options: [],),
      );
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // ✅ base background
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: FooterBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected, onCenterTap: () {  },
      ),
    );
  }
}
