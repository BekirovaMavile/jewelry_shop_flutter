import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/_data.dart';


part 'jew_state.dart';

class JewCubit extends Cubit<JewState> {
  get getCartList => state.jewList.where((element) => element.cart).toList();

  get isFavorite =>
      state.jewList.where((element) => element.isFavorite).toList();

  JewCubit() : super(JewState.initial(AppData.jewItems));

  increaseQuantity(Jew jew) {
    final List<Jew> jewList = state.jewList.map((element) {
      if (element.id == jew.id) {
        return jew.copyWith(quantity: jew.quantity + 1);
      }
      return element;
    }).toList();

    emit(JewState(jewList: jewList));
  }

  decreaseQuantity(Jew jew) {
    final List<Jew> jewList = state.jewList.map((element) {
      if (element.id == jew.id && element.quantity > 1) {
        return jew.copyWith(quantity: jew.quantity - 1);
      }
      return element;
    }).toList();
    emit(JewState(jewList: jewList));
  }

  addToCart (Jew jew){
    final List<Jew> cartList = state.jewList.map((element) {
      if (element.id == jew.id) {
        return jew.copyWith(cart:true);
      }
      return element;
    }).toList();
    emit(JewState(jewList: cartList));
  }

  deleteFromCart(Jew jew){
    final List<Jew> cartList = state.jewList.map((element) {
      if (element.id == jew.id) {
        return jew.copyWith(cart:false);
      }
      return element;
    }).toList();
    emit(JewState(jewList: cartList));
  }

  isFavoriteTab(Jew jew){
    int index = state.jewList.indexWhere((element) => element.id == jew.id);
    final List<Jew> jewList = state.jewList.map((element) {
      if (element.id == jew.id) {
        return jew.copyWith(isFavorite: !state.jewList[index].isFavorite);
      }
      return element;
    }).toList();
    emit(JewState(jewList: jewList));
  }

  void cleanCart(){
    final List<Jew> cartList = state.jewList.map((element) {
      return element.copyWith(cart:false);
    }).toList();
    emit(JewState(jewList: cartList));
  }

  String priceJew(Jew jew){
    double price = 0;
    price = jew.quantity * jew.price;
    return price.toString();
  }

  double get subtotalPrice{
    double subtotal = 0;
    for (var element in state.jewList){
      if (element.cart){
        subtotal += element.quantity * element.price;
      }
    }
    return subtotal;
  }
}
