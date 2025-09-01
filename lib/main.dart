// // ignore_for_file: unused_import




import 'package:Retail_Application/core/providers/locale_provider.dart';
import 'package:Retail_Application/example/apz_footer_example.dart' ;
import 'package:Retail_Application/example/header_footer_example.dart';
import 'package:Retail_Application/ui/screens/input_screen.dart';
import 'package:Retail_Application/example/apz_header_example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:Retail_Application/l10n/app_localizations.dart';

void main() {
  runApp(const AppWrapper());
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: provider.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      home:FooterHeaderScreen(),
      //ExampleHeaderScreen
    );
  }
}


// import 'package:Retail_Application/example/appz_alert_example.dart';
// import 'package:Retail_Application/example/appz_checkbox_example.dart';
// import 'package:Retail_Application/example/apz_dropdown_example.dart';
// import 'package:Retail_Application/example/apz_phone_with_dropdown_example.dart';
// import 'package:Retail_Application/example/apz_searchbar_example.dart';
// import 'package:Retail_Application/example/apz_toast_example.dart';
// import 'package:Retail_Application/themes/dark_theme.dart';
// import 'package:Retail_Application/ui/components/apz_dropdown.dart';
// import 'package:Retail_Application/ui/screens/input_dropdown.dart';
// import 'package:Retail_Application/ui/screens/input_screen.dart';
// import 'package:Retail_Application/themes/apz_app_themes.dart';
// import 'package:flutter/material.dart';
// import 'package:Retail_Application/ui/screens/product_screen.dart';
// import 'package:Retail_Application/ui/screens/stock_screen.dart';
// import 'package:Retail_Application/ui/screens/weather_screen.dart';

// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   ThemeMode _themeMode = ThemeMode.light;

//   void _toggleTheme() {
//     setState(() {
//       _themeMode =
//           _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         scaffoldBackgroundColor: AppColors.background_primary(context),
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor: AppColors.background_primary(context),
//       ),
//       themeMode: _themeMode,
//       home: Scaffold(
//         body:PhoneInputExample(),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _toggleTheme,
//           child: const Icon(Icons.brightness_6),
//         ),
//       ),
//     );
//   }
// }
// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         brightness: Brightness.light,
// //         scaffoldBackgroundColor: AppColors.background_primary(context),
// //       ),
// //       darkTheme: ThemeData(
// //         brightness: Brightness.dark,
// //         scaffoldBackgroundColor: AppColors.background_primary(context),
// //       ),
// //       home: InputDemoScreen(),
// //     );
// //   }
// // }
// // //   @override
// // //   State<MyApp> createState() => _MyAppState();
// // // }

// // class _MyAppState extends State<MyApp> {
// //   ThemeMode _themeMode = ThemeMode.light;

// //   void _toggleTheme() {
// //     setState(() {
// //       _themeMode =
// //           _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
// //     });
// //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return const MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       home: PhoneInputExample(),
// // //     );
// // //   }
// // // }
