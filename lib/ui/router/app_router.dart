import 'package:Retail_Application/ui/screens/product_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: '/products',
  routes: [
    GoRoute(
      path: '/products',
      name: 'products',
      builder: (context, state) => const ProductScreen(),
      // Example of a future nested route:
      // routes: [
      //   GoRoute(
      //     path: ':id', // e.g., /products/1
      //     name: 'product-details',
      //     builder: (context, state) {
      //       final id = state.pathParameters['id']!;
      //       return ProductDetailsScreen(id: id);
      //     },
      //   ),
      // ],
    ),
  ],
  // Optional: Add an error builder for handling 404 pages
  // errorBuilder: (context, state) => const NotFoundScreen(),
);
