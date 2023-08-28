part of 'theme_cubit.dart';

@immutable
class ThemeState {
  final ThemeData theme;

  const ThemeState({required this.theme});

  ThemeState copyWith({ThemeData? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }

  factory ThemeState.initial() {
    return ThemeState(theme: AppTheme.lightTheme!);
  }
}