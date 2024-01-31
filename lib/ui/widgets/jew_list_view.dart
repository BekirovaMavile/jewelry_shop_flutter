import 'package:flutter/material.dart';
import 'package:jewellry_shop/ui/extensions/app_extension.dart';

import '../../data/_data.dart';
import '../../ui_kit/_ui_kit.dart';
import '../_ui.dart';

class JewListView extends StatelessWidget {
  const JewListView({
    super.key,
    required this.jews,
    this.isReversed = false
  });

  final List<Jew> jews;
  final bool isReversed;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 20),
          itemBuilder: (_, index) {
            Jew jew = isReversed ? jews.reversed.toList()[index] : jews[index];
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => JewDetail(jew: jew)
                    )
                );
              },
              child: Container(
                width: 180,
                decoration: BoxDecoration(
                  color: isDark ?
                  DarkThemeColor.primaryLight :
                  Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(jew.image, scale: 6, height: 90),
                        Text(
                          "${jew.price}₽",
                          style: AppTextStyle.h3Style.copyWith(color: LightThemeColor.purple),
                        ),
                        Text(
                          jew.name,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ).fadeAnimation(0.7),
                  ),
              ),
            );
          },
          separatorBuilder: (_, __) {
            return Container(
              width: 30,
            );
          },
          itemCount: jews.length),
    );
  }
}

