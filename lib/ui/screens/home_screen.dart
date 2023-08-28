import 'package:flutter/material.dart';
import 'package:jewellry_shop/data/_data.dart';
import 'package:jewellry_shop/states/jew_state.dart';

import '../_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Widget> screens = [
    const JewList(),
    CartScreen(key: JewState().cartKey,),
    FavoriteScreen(key: JewState().favoriteKey,),
    const ProfileScreen()
  ];
  int currentIndex = 0;

  void onTabTap(int index) {
    if (currentIndex == index) return;
    currentIndex = index;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTap,
        selectedFontSize: 0,
        items: AppData.bottomNavigationItems.map(
          (element) {
            return BottomNavigationBarItem(
              icon: element.disableIcon,
              label: element.label,
              activeIcon: element.enableIcon,
            );
          },
        ).toList(),
      ),
    );
  }
}
