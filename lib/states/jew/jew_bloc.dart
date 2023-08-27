import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/_data.dart';

part 'jew_event.dart';
part 'jew_state.dart';

class JewBloc extends Bloc<JewEvent, JewState> {
  get getCartList => state.jewList.where((element) => element.cart).toList();

  get isFavorite =>
      state.jewList.where((element) => element.isFavorite).toList();

  JewBloc() : super(JewState.initial(AppData.jewItems)) {
    on<IncreaseQuantityEvent>(_increaseQuantity);
    on<DecreaseQuantityEvent>(_decreaseQuantity);
    on<AddToCartEvent>(_addToCart);
    on<DeleteFromCartEvent>(_deleteFromCart);
    on<FavoriteListEvent>(_isFavorite);
    // on<CleanCartEvent>(_cleanCart);
  }

  _increaseQuantity(IncreaseQuantityEvent event, Emitter<JewState> emit) {
    final List<Jew> jewList = state.jewList.map((element) {
      if (element.id == event.jew.id) {
        return event.jew
            .copyWith(quantity: event.jew.quantity + 1);
      }
      return element;
    }).toList();

    emit(JewState(jewList: jewList));
  }

  void _decreaseQuantity(DecreaseQuantityEvent event, Emitter<JewState> emit) {
    final List<Jew> jewList = state.jewList.map((element) {
      if (element.id == event.jew.id && element.quantity > 1) {
        return event.jew
            .copyWith(quantity: event.jew.quantity - 1);
      }
      return element;
    }).toList();
    emit(JewState(jewList: jewList));
  }

  void _addToCart (AddToCartEvent event, Emitter<JewState> emit){
    final List<Jew> cartList = state.jewList.map((element) {
      if (element.id == event.jew.id) {
        return event.jew.copyWith(cart:true);
      }
      return element;
    }).toList();
    emit(JewState(jewList: cartList));
  }

  void _deleteFromCart(DeleteFromCartEvent event, Emitter<JewState> emit){
    final List<Jew> cartList = state.jewList.map((element) {
      if (element.id == event.jew.id) {
        return event.jew.copyWith(cart:false);
      }
      return element;
    }).toList();
    emit(JewState(jewList: cartList));
  }

  void _isFavorite(FavoriteListEvent event, Emitter<JewState> emit){
    int index = state.jewList.indexWhere((element) => element.id == event.jew.id);
    final List<Jew> jewList = state.jewList.map((element) {
      if (element.id == event.jew.id) {
        return event.jew
            .copyWith(isFavorite: !state.jewList[index].isFavorite);
      }
      return element;
    }).toList();
    emit(JewState(jewList: jewList));
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
