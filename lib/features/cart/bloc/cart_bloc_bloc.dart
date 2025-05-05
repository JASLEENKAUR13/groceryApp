import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_grocery_app/data/cart_items.dart';
import 'package:my_grocery_app/data/wishlist_items.dart';
import 'package:my_grocery_app/features/home/models/home_product_dataModel.dart';
import 'package:my_grocery_app/features/wishlist/Ui/wishlist.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<cartInitialEvent>(CartInitialEvent);
    on<removefromCartEvent>(RemovefromcartEvent);
    on<CartProductWishlistButtonClickedEvent>(cartProductWishlistButtonClickedEvent);
  }
  
 

  FutureOr<void> CartInitialEvent(cartInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartSucessState(cartitems:  cartitems));
  }
  
  

  FutureOr<void> RemovefromcartEvent(removefromCartEvent event, Emitter<CartBlocState> emit) {
    
    cartitems.remove(event.cartproduct);
    emit(RemovedfromCartmsgState());
    emit(CartSucessState(cartitems: cartitems)); 

  }

  FutureOr<void> cartProductWishlistButtonClickedEvent(CartProductWishlistButtonClickedEvent event, Emitter<CartBlocState> emit) {

     Wishlistitems.add(event.wishlistproduct);
     emit(AddedIntoWishlistedmsgState());
  }
}


