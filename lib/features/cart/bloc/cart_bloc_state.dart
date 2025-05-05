part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

sealed class CartBlocActionState extends CartBlocState{}

final class CartBlocInitial extends CartBlocState {}




class CartSucessState extends CartBlocState{
  final List<ProductDatamodel> cartitems ;
  CartSucessState({required this.cartitems});
}


class AddedIntoWishlistedmsgState extends CartBlocActionState{}

class RemovedfromCartmsgState extends CartBlocActionState{}

