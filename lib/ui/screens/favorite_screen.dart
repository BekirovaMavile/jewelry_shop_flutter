import 'package:flutter/material.dart';
import 'package:jewellry_shop/data/_data.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/ui/extensions/app_extension.dart';
import 'package:jewellry_shop/ui/widgets/empty_wrapper.dart';
import 'package:jewellry_shop/ui_kit/_ui_kit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  // var favoriteJew = AppData.favoriteItems;
  List<Jew> get favoriteJew => JewState().favorite;

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: EmptyWrapper(
        type: EmptyWrapperType.favorite,
        title: 'Empty favorite',
        isEmpty: favoriteJew.isEmpty,
        child: _favoriteListView(),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Favorite screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget _favoriteListView() {
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      itemCount: favoriteJew.length,
      itemBuilder: (_, index) {
        Jew jew = favoriteJew[index];
        return Card(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : DarkThemeColor.primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            title: Text(
              jew.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            leading: Image.asset(jew.image),
            subtitle: Text(
              jew.description,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: const Icon(AppIcon.heart, color: Colors.redAccent),
          ),
        ).fadeAnimation(index * 0.6);
      },
      separatorBuilder: (_, __) => Container(
        height: 20,
      ),
    );
  }
}
