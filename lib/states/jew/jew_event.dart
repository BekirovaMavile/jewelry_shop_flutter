part of 'jew_bloc.dart';

@immutable
abstract class JewEvent {
  final Jew jew;

  const JewEvent(this.jew);

  @override
  List<Object?> get props => [jew];
}

class IncreaseQuantityEvent extends JewEvent {
  const IncreaseQuantityEvent(Jew jew) : super(jew);
}

class DecreaseQuantityEvent extends JewEvent {
  const DecreaseQuantityEvent(Jew jew) : super(jew);
}

class AddToCartEvent extends JewEvent {
  const AddToCartEvent(Jew jew) : super(jew);
}

class DeleteFromCartEvent extends JewEvent {
  const DeleteFromCartEvent(Jew jew) : super(jew);
}

class FavoriteListEvent extends JewEvent {
  const FavoriteListEvent(Jew jew) : super(jew);
}