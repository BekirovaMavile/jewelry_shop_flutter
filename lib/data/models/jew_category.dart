import 'package:jewellry_shop/data/models/jew.dart';

class JewCategory {
  final JewType type;
  bool isSelected;

  JewCategory(this.type, this.isSelected);

  JewCategory copyWith({JewType? type, bool? isSelected}) {
    return JewCategory(
      type ?? this.type,
      isSelected ?? this.isSelected,
    );
  }
}