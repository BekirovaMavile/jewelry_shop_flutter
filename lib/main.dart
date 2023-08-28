import 'package:flutter/material.dart';
import 'package:jewellry_shop/states/jew/jew_cubit.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/states/theme/theme_cubit.dart';
import 'package:jewellry_shop/ui/_ui.dart';
import 'package:jewellry_shop/ui/screens/home_screen.dart';
import 'package:jewellry_shop/ui/screens/welcome_screen.dart';
import 'package:jewellry_shop/ui_kit/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states/category/category_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
        BlocProvider(
          create: (context) => JewCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Jewellery Shop',
            theme: state.theme,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
