import 'package:flutter/material.dart';
import 'package:jewellry_shop/ui/widgets/animations/fade_animation.dart';

import '../../data/_data.dart';

extension StringExtension on String {
  // String get toCapital => this[0].toUpperCase() + substring(1, length);

  String translateToRussian() {
    switch (this) {
      case 'all':
        return 'Все';
      case 'ring':
        return 'Кольцо';
      case 'earring':
        return 'Серьги';
      case 'watch':
        return 'Часы';
      case 'bracelet':
        return 'Браслет';
      case 'pendant':
        return 'Подвеска';
      case 'brooch':
        return 'Брошь';
      default:
        return '';
    }
  }
}

extension WidgetExtension on Widget {
  Widget fadeAnimation(double delay) {
    return FadeAnimation(delay: delay, child: this);
  }
}
