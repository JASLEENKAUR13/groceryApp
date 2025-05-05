part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocEvent {}

class WishlistIntialEvent extends WishlistBlocEvent{}

class removefromwishlistEvent extends WishlistBlocEvent{
  final ProductDatamodel wishlistitem ;
  removefromwishlistEvent({required this.wishlistitem});
}

class addIntoCartEvent extends WishlistBlocEvent{
  final ProductDatamodel wishlistitem;
  addIntoCartEvent({required this.wishlistitem});
 
}