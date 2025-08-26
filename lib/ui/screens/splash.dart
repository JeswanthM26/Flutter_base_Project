// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart'; // Optional, for navigation

// class FullScreenSplash extends StatefulWidget {
//   const FullScreenSplash({Key? key}) : super(key: key);

//   @override
//   State<FullScreenSplash> createState() => _FullScreenSplashState();
// }

// class _FullScreenSplashState extends State<FullScreenSplash> {
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(const Duration(seconds: 3), () {
//       if (mounted) {
//         context.go('/onboarding'); // Navigate to onboarding screen after splash
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             'assets/images/Splash.png', // Your full-screen splash image
//             fit: BoxFit.cover,
//           ),
//         ],
//       ),
//     );
//   }
// }
