
// import 'package:Retail_Application/example/appz_button_example.dart';
// import 'package:Retail_Application/example/appz_radio_example.dart';
// import 'package:Retail_Application/example/apz_dropdown_example.dart';
// import 'package:Retail_Application/example/apz_searchbar_example.dart';
// import 'package:flutter/material.dart';
// import 'package:Retail_Application/ui/components/apz_footer.dart';

// // Example pages:
// // class HomePage extends StatelessWidget { /* ... */ }
// // class AccountsPage extends StatelessWidget { /* ... */ }
// // class CenterActionPage extends StatelessWidget { /* ... */ }
// // class CardsPage extends StatelessWidget { /* ... */ }
// // class SpendsPage extends StatelessWidget { /* ... */ }

// class FooterExampleScreen extends StatefulWidget {
//   const FooterExampleScreen({super.key});
//   @override
//   _FooterExampleScreenState createState() => _FooterExampleScreenState();
// }

// class _FooterExampleScreenState extends State<FooterExampleScreen> {
//   int _selectedIndex = 0;

//   final _pages = const [
//     ApzDropdownExample(),
//     AppzRadioExample(),
//     SearchBarDemoPage(),
//     AppzButtonExample(),
//     ApzDropdownExample(),
//      //CenterActionPage(),
//     // HomePage(),
//     // AccountsPage(),
//     // CenterActionPage(),
//     // CardsPage(),
//     // SpendsPage(),
//   ];

//   void _onItemSelected(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: FooterBar(
//         selectedIndex: _selectedIndex,
//         onItemSelected: _onItemSelected,
//         pages: _pages,
//       ),
//     );
//   }
// }
import 'package:Retail_Application/example/appz_button_example.dart';
import 'package:Retail_Application/example/appz_radio_example.dart';
import 'package:Retail_Application/example/apz_dropdown_example.dart';
import 'package:Retail_Application/example/apz_searchbar_example.dart';
import 'package:flutter/material.dart';
import 'package:Retail_Application/ui/components/apz_footer.dart';

class FooterExampleScreen extends StatefulWidget {
  const FooterExampleScreen({super.key});
  @override
  _FooterExampleScreenState createState() => _FooterExampleScreenState();
}

class _FooterExampleScreenState extends State<FooterExampleScreen> {
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
      // ✅ Use IndexedStack so pages keep state when switching
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: FooterBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected, 
        onCenterTap: () {  },
      ),
    );
  }
}
