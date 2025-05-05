part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocState {}

sealed class WishlistActionState extends WishlistBlocState{}

final class WishlistBlocInitial extends WishlistBlocState {}



class WishlistSuccessState extends WishlistBlocState{
  final List<ProductDatamodel> wishlist ;

  WishlistSuccessState({required this.wishlist});
}


class RemovedfromWishlistmsgState extends WishlistActionState{}

class AddedIntoCartmsgState extends WishlistActionState{}

