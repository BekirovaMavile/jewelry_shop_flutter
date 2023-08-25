import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jewellry_shop/data/_data.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/ui/extensions/app_extension.dart';
import 'package:jewellry_shop/ui/widgets/counter_button.dart';
import 'package:jewellry_shop/ui/widgets/empty_wrapper.dart';
import 'package:jewellry_shop/ui_kit/_ui_kit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  List<Jew> get cartJew => JewState().cart;
  double get subtotal => JewState().subtotal;
  double taxes = 5.0;

  void onIncrementTap(Jew jew) async{
    await JewState().onIncreaseQuantityTap(jew);
    setState(() {
    });
  }

  void onDecrementTap(Jew jew) async{
    await JewState().onDecreaseQuantityTap(jew);
    setState(() {
    });
  }

  void update() {
    setState(() {});
  }

  void onRemoveFromCart(Jew jew) async {
    await JewState().onRemoveFromCartTap(jew);
    setState(() {
    });
  }

  void onCheckOutTap() async {
    await JewState().onCheckOutTap();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: EmptyWrapper(
        title: "Empty cart",
        isEmpty: cartJew.isEmpty,
        child: _cartListView(),
      ),
      bottomNavigationBar: cartJew.isEmpty? const SizedBox() : _bottomAppBar(),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Cart screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget _cartListView() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      itemCount: cartJew.length,
      itemBuilder: (_, index) {
        final jew = JewState().cart[index];
        return Dismissible(
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              onRemoveFromCart(jew);
            }
          },
          key: UniqueKey(),
          background: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const FaIcon(FontAwesomeIcons.trash),
              ).fadeAnimation(index * 0.6),
            ],
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isDark ?
              DarkThemeColor.primaryLight :
              Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 20),
                Image.asset(cartJew[index].image, scale: 10),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartJew[index].name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$${cartJew[index].price}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    CounterButton(
                      onIncrementTap: () => onIncrementTap(jew),
                      onDecrementTap: () => onDecrementTap(jew),
                      size: const Size(24, 24),
                      padding: 0,
                      label: Text(
                        cartJew[index].quantity.toString(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Text(
                      "\$${JewState().jewPrice(jew)}",
                      style: AppTextStyle.h2Style
                          .copyWith(color: LightThemeColor.purple),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        height: 20,
      ),
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
          height: 250,
          child: Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? DarkThemeColor.primaryLight
                : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "\$${subtotal.toString()}",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Taxes",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "\$$taxes",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(thickness: 4.0, height: 30.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            "\$${(taxes + subtotal).toString()}",
                            style: AppTextStyle.h2Style.copyWith(
                              color: LightThemeColor.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton(
                          onPressed: onCheckOutTap,
                          child: const Text("Checkout"),
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
