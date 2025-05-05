import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_grocery_app/data/cart_items.dart';
import 'package:my_grocery_app/data/wishlist_items.dart';
import 'package:my_grocery_app/features/home/models/home_product_dataModel.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<WishlistIntialEvent>(wishlistIntialEvent );
    on<removefromwishlistEvent>(RemovefromwishlistEvent );
    on<addIntoCartEvent>(AddIntoCartEvent);
  }

  FutureOr<void> wishlistIntialEvent(WishlistIntialEvent event, Emitter<WishlistBlocState> emit) {
    emit(WishlistSuccessState(wishlist: Wishlistitems));
  }



  FutureOr<void> RemovefromwishlistEvent(removefromwishlistEvent event, Emitter<WishlistBlocState> emit) {

    Wishlistitems.remove(event.wishlistitem);
    emit(RemovedfromWishlistmsgState());
    emit(WishlistSuccessState(wishlist: Wishlistitems));

  }


  FutureOr<void> AddIntoCartEvent(addIntoCartEvent event, Emitter<WishlistBlocState> emit) {

    cartitems.add(event.wishlistitem);
    emit(AddedIntoCartmsgState());
  }
}
