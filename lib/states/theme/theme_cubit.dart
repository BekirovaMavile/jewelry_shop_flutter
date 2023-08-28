import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../ui_kit/_ui_kit.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  switchTheme() {
    if (state.theme == AppTheme.lightTheme) {
      emit(state.copyWith(theme: AppTheme.darkTheme!));
    } else {
      emit(state.copyWith(theme: AppTheme.lightTheme!));
    }
  }
}
