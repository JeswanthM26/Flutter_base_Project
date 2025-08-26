// ignore_for_file: unused_import

import 'package:Retail_Application/example/appz_alert_example.dart';
import 'package:Retail_Application/example/appz_checkbox_example.dart';
import 'package:Retail_Application/example/apz_dropdown_example.dart';
import 'package:Retail_Application/example/apz_phone_with_dropdown_example.dart';
import 'package:Retail_Application/example/apz_searchbar_example.dart';
import 'package:Retail_Application/example/apz_toast_example.dart';
import 'package:Retail_Application/ui/components/apz_dropdown.dart';
import 'package:Retail_Application/ui/screens/input_dropdown.dart';
import 'package:Retail_Application/ui/screens/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:Retail_Application/ui/screens/product_screen.dart';
import 'package:Retail_Application/ui/screens/stock_screen.dart';
import 'package:Retail_Application/ui/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputFieldPreviewScreen(),
    );
  }
}
// import 'package:Retail_Application/themes/apz_theme_provider.dart';
// import 'package:Retail_Application/ui/router/app_router.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     // The ChangeNotifierProvider makes the ThemeProvider available to the whole app
//     ChangeNotifierProvider(
//       create: (_) => ThemeProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // This listens to the ThemeProvider so the UI rebuilds when the theme changes
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Base Project',
//       // Provide the light and dark theme data
//       // theme: AppThemes.lightTheme,
//       // darkTheme: AppThemes.darkTheme,
//       // The themeMode is controlled by our provider
//       themeMode: themeProvider.themeMode,
//       // The routerConfig tells the app how to handle navigation
//       routerConfig: AppRouter.router,
//     );
//   }
// }
