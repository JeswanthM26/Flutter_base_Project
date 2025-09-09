


// import 'package:Retail_Application/core/providers/locale_provider.dart';
// import 'package:Retail_Application/example/apz_footer_example.dart';
// import 'package:Retail_Application/example/header_footer_example.dart';
// import 'package:Retail_Application/themes/apz_app_themes.dart';
// import 'package:Retail_Application/ui/components/apz_themed_background.dart';
// import 'package:Retail_Application/ui/screens/input_screen.dart';
// import 'package:Retail_Application/example/apz_header_example.dart';
// import 'package:Retail_Application/themes/apz_theme_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:Retail_Application/l10n/app_localizations.dart';
// import 'package:Retail_Application/ui/screens/menu_screen.dart';

// void main() {
//   runApp(const AppWrapper());
// }

// class AppWrapper extends StatelessWidget {
//   const AppWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => LocaleProvider()),
//         ChangeNotifierProvider(create: (context) => ThemeProvider()),
//       ],
//       child: const MyApp(),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LocaleProvider>(context);
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       locale: provider.locale,
//       localizationsDelegates: const [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: L10n.all,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         scaffoldBackgroundColor:Colors.transparent,
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor:Colors.transparent,
//       ),
//       //themeMode: themeProvider.themeMode,
//        builder: (context, child) {
//         return ApzThemedBackground(
//           child: child!,
//         );
//       },
//       home: FooterHeaderScreen(),
//     );
//   }
// }
import 'package:Retail_Application/core/providers/locale_provider.dart';
import 'package:Retail_Application/example/header_footer_example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:Retail_Application/l10n/app_localizations.dart';
import 'package:Retail_Application/ui/components/apz_themed_background.dart';

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

// Converted MyApp to a StatefulWidget to manage theme state
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variable to hold the current theme mode
  ThemeMode _themeMode = ThemeMode.light;

  // Function to toggle the theme
  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

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
      themeMode: _themeMode, // Use the state variable here
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      builder: (context, child) {
        // Use a Stack to place the FloatingActionButton on top of the main content
        return Stack(
          children: [
            // The main app content with its background
            ApzThemedBackground(
              child: child!,
            ),
            // The theme toggle button
            Positioned(
              bottom: 80, // Positioned above the bottom navigation bar
              right: 20,
              child: FloatingActionButton(
                onPressed: _toggleTheme,
                child: const Icon(Icons.brightness_6),
              ),
            ),
          ],
        );
      },
      home: FooterHeaderScreen(),
    );
  }
}
