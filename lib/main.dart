import 'package:flutter/material.dart';
import 'package:jewellry_shop/ui/_ui.dart';
import 'package:jewellry_shop/ui_kit/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jewellery Shop',
      theme: AppTheme.lightTheme,
      home: const JewList(),
    );
  }
}
