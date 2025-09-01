import 'package:Retail_Application/example/appz_button_example.dart';
import 'package:Retail_Application/example/appz_radio_example.dart';
import 'package:Retail_Application/example/apz_dropdown_example.dart';
import 'package:Retail_Application/example/apz_searchbar_example.dart';
import 'package:flutter/material.dart';
import 'package:Retail_Application/ui/components/apz_footer.dart';
import 'package:Retail_Application/ui/components/apz_header.dart';

class FooterHeaderScreen extends StatefulWidget {
  const FooterHeaderScreen({super.key});
  @override
  _FooterExampleScreenState createState() => _FooterExampleScreenState();
}

class _FooterExampleScreenState extends State<FooterHeaderScreen> {
  int _selectedIndex = 0;

  final _pages = const [
    ApzDropdownExample(),
    AppzRadioExample(),
    SearchBarDemoPage(),
    AppzButtonExample(),
    ApzDropdownExample(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// ✅ Header stays on top
          ApzHeader(
            hasNotification: true,
            onSearchTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Search tapped")),
              );
            },
            onNotificationTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notifications tapped")),
              );
            },
            onProfileTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Profile tapped")),
              );
            },
          ),

          /// ✅ Page content below header
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
          ),
        ],
      ),

      /// ✅ Footer stays fixed at bottom
      bottomNavigationBar: FooterBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
      ),
    );
  }
}
