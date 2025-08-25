// ignore_for_file: unused_import

import 'package:Retail_Application/example/appz_checkbox_example.dart';
import 'package:Retail_Application/example/apz_dropdown_example.dart';
import 'package:Retail_Application/example/apz_searchbar_example.dart';
import 'package:Retail_Application/example/apz_toast_example.dart';
import 'package:Retail_Application/ui/components/apz_dropdown.dart';
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
      home:InputFieldPreviewScreen (),
    );
  }
}
