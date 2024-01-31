import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jewellry_shop/SQLite/sqlite.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/ui/extensions/app_extension.dart';
import 'package:jewellry_shop/ui/widgets/jew_list_view.dart';
import '../../data/_data.dart';
import '../../ui_kit/_ui_kit.dart';

class JewList extends StatefulWidget {
  const JewList({super.key});

  @override
  State<StatefulWidget> createState() => JewListState();
}

class JewListState extends State<JewList> {
  List<Jew> get jewsByCategory => JewState().jewsByCategory;
  List<JewCategory> get categories => JewState().categories;
  List<Jew> get jews => JewState().jews;
  final db = DatabaseHelper();

  void onCategoryTap(JewCategory category) async {
    await JewState().onCategoryTap(category);
    setState(() {});
  }

  String? username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  _loadUsername() async {
    String? fetchedUsername = await db.getUsername();
    setState(() {
      username = fetchedUsername;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _appBar(context),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Привет, ${username ?? 'Гость'}",
                  style: Theme.of(context).textTheme.headlineSmall,
                ).fadeAnimation(0.2),
                Text(
                  "Что бы вы хотели выбрать\nсегодня?",
                  style: Theme.of(context).textTheme.displayLarge,
                ).fadeAnimation(0.4),
                _searchBar(),
                Text(
                  "Доступно для вас",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                _categories(),
                JewListView(jews: jewsByCategory),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Лучшие товары недели",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Все",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: LightThemeColor.purple),
                        ),
                      ),
                    ],
                  ),
                ),
                JewListView(jews: jews, isReversed: true),
              ],
            ),
          ),
        ),
      );

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.dice),
        onPressed: () => JewState().toggleTheme(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on_outlined,
              color: LightThemeColor.purple),
          Text(
            "Location",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge(
            badgeStyle:
                const BadgeStyle(badgeColor: LightThemeColor.purple),
            badgeContent: const Text(
              "2",
              style: TextStyle(color: Colors.white),
            ),
            position: BadgePosition.topStart(start: -3),
            child: const Icon(Icons.notifications_none, size: 30),
          ),
        )
      ],
    );
  }

  Widget _searchBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Найти товар',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _categories() {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          height: 40,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    onCategoryTap(category);
                  },
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: category.isSelected
                          ? LightThemeColor.purple
                          : Colors.transparent,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      category.type.name.translateToRussian(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                    width: 5,
                    height: 30,
                  ),
              itemCount: categories.length),
        ));
  }
}
