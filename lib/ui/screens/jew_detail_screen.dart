import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jewellry_shop/data/_data.dart';
import 'package:jewellry_shop/states/jew/jew_cubit.dart';

// import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/ui/extensions/app_extension.dart';
import 'package:jewellry_shop/ui/widgets/animations/scale_tween_animation_builder.dart';
import 'package:jewellry_shop/ui/widgets/counter_button.dart';
import 'package:jewellry_shop/ui_kit/_ui_kit.dart';

class JewDetail extends StatefulWidget {
  const JewDetail({super.key, required this.jew});

  final Jew jew;

  @override
  State<JewDetail> createState() => JewDetailState();
}

class JewDetailState extends State<JewDetail> {
  late Jew jew = widget.jew;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: ScaleTweenAnimationBuilder(
          child: Image.asset(jew.image, scale: 2),
        ),
      ),
      floatingActionButton: _floatingActionButton(),
      bottomNavigationBar: _bottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back),
      ),
      title: Text(
        'Jewellery Detail Screen',
        style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white),
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
    );
  }

  Widget _floatingActionButton() {
    final List<Jew> jewList = context.watch<JewCubit>().state.jewList;
    final jewIndex = jewList.indexWhere((element) => element.id == jew.id);
    return FloatingActionButton(
      elevation: 0.0,
      backgroundColor: LightThemeColor.purple,
      onPressed: () {
        if (jewIndex != -1) {
          context.read<JewCubit>().isFavoriteTab(jew);
        }
      },
      child: jewIndex != -1 && jewList[jewIndex].isFavorite
          ? const Icon(AppIcon.heart)
          : const Icon(AppIcon.outlinedHeart),
    );
  }

  Widget _bottomAppBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomAppBar(
        child: SizedBox(
          height: 300,
          child: Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? DarkThemeColor.primaryLight
                : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          itemPadding: EdgeInsets.zero,
                          itemSize: 20,
                          initialRating: jew.score,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          glow: false,
                          ignoreGestures: true,
                          itemBuilder: (_, __) => const FaIcon(
                            FontAwesomeIcons.solidStar,
                            color: LightThemeColor.yellow,
                          ),
                          onRatingUpdate: (rating) {
                            print('$rating');
                          },
                        ),
                        const SizedBox(width: 15),
                        Text(
                          jew.score.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "(${jew.voter})",
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ).fadeAnimation(0.4),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${jew.price}",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: LightThemeColor.purple),
                        ),
                        BlocBuilder<JewCubit, JewState>(
                          builder: (context, state) {
                            final int jewIndex = state.jewList
                                .indexWhere((element) => element.id == jew.id);
                            if (jewIndex != -1) {
                              final int quantity =
                                  state.jewList[jewIndex].quantity;
                              return CounterButton(
                                onIncrementTap: () => context
                                    .read<JewCubit>().increaseQuantity(state.jewList[jewIndex]),
                                onDecrementTap: () => context
                                    .read<JewCubit>().decreaseQuantity(state.jewList[jewIndex]),
                                label: Text(
                                  '$quantity',
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        )
                      ],
                    ).fadeAnimation(0.6),
                    const SizedBox(height: 15),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.displayMedium,
                    ).fadeAnimation(0.8),
                    const SizedBox(height: 15),
                    Text(
                      jew.description,
                      style: Theme.of(context).textTheme.titleMedium,
                    ).fadeAnimation(0.8),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton(
                          onPressed: () => context
                              .read<JewCubit>().addToCart(jew),
                          child: const Text("Add to cart"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
