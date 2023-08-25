import 'package:flutter/material.dart';
import 'package:jewellry_shop/ui/widgets/animations/fade_animation.dart';

extension StringExtension on String {
  String get toCapital => this[0].toUpperCase() + substring(1, length);
}

extension WidgetExtension on Widget {
  Widget fadeAnimation(double delay) {
    return FadeAnimation(delay: delay, child: this);
  }
}
