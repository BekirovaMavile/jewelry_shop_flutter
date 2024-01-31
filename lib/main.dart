import 'package:flutter/material.dart';
import 'package:jewellry_shop/authtentication/login_screen.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/ui/_ui.dart';
import 'package:jewellry_shop/ui/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewellry_shop/ui/screens/splash_screen.dart';
import 'package:jewellry_shop/ui_kit/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: JewState().isLight,
      builder: (_, isLight, __) {
        return MaterialApp(
          title: 'Jewellery Shop',
          theme: isLight
              ? AppTheme.lightTheme
              : AppTheme.darkTheme,
          home: const LoginScreen(),
        );
      },
    );
  }
}
