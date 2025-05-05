part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}


class cartInitialEvent extends CartBlocEvent{}

class removefromCartEvent extends CartBlocEvent{
   final ProductDatamodel cartproduct;
  removefromCartEvent({required this.cartproduct});
}

class CartProductWishlistButtonClickedEvent extends CartBlocEvent{
  final ProductDatamodel wishlistproduct;
  CartProductWishlistButtonClickedEvent({required this.wishlistproduct});

}

