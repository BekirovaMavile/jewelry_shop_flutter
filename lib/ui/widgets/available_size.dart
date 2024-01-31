import 'package:flutter/material.dart';
import 'package:jewellry_shop/ui_kit/_ui_kit.dart';

class AvailableSize extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const AvailableSize({
    Key? key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 16.0),
        constraints: const BoxConstraints(
          minWidth: 20,
          maxWidth: 70,
          minHeight: 30,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? LightThemeColor.purple : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: LightThemeColor.purple),
        ),
        child: Text(
          size,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
