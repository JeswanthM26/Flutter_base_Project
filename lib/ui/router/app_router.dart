import 'package:Retail_Application/ui/screens/onboarding_screen.dart';
import 'package:Retail_Application/ui/screens/product_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/', // Splash screen remains the initial route
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const FullScreenSplash(),
      // ),
      GoRoute(
        path: '/',
        builder: (context, state) {
          if (kIsWeb) {
            // On web, skip onboarding and go to products instead
            return const ProductScreen();
          }
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) => const ProductScreen(),
      ),
    ],
  );
}
