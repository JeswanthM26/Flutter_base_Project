import 'package:flutter/material.dart';
import 'package:flutter_base_pro/ui/router/app_router.dart';
import 'package:flutter_base_pro/themes/apz_app_themes.dart';
import 'package:flutter_base_pro/themes/apz_theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // The ChangeNotifierProvider makes the ThemeProvider available to the whole app
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This listens to the ThemeProvider so the UI rebuilds when the theme changes
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: 'Flutter Base Project',
      // Provide the light and dark theme data
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      // The themeMode is controlled by our provider
      themeMode: themeProvider.themeMode,
      // The routerConfig tells the app how to handle navigation
      routerConfig: AppRouter.router,
    );
  }
}