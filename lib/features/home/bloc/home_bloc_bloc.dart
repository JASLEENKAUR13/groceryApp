import 'dart:async';
import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_grocery_app/data/cart_items.dart';
import 'package:my_grocery_app/data/grocery_data.dart';
import 'package:my_grocery_app/data/wishlist_items.dart';
import 'package:my_grocery_app/features/home/models/home_product_dataModel.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    // it will say on this event do this
     on<HomeInitialEvent>(homeInitailEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
   
 


    

  }
  FutureOr<void> homeInitailEvent(HomeInitialEvent event,
   Emitter<HomeBlocState> emit) async  {

    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds:3));
    emit(HomeLoadedSuccessState(products: 
    GroceryData.groceryItems
    .map((e) => 
    ProductDatamodel(id:  e["id"], 
    
    name: e["name"], 
    descrpition: e['description'], 
    price: e['price'],
     imageurl: e['image']) ) .toList()
    ));
  }



  

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, 
  Emitter<HomeBlocState> emit) {
    //print("product added to wishlist");
    
    
    Wishlistitems.add(event.wishlistproduct);
    emit(ProductwishlistedmsgState());

  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, 
  Emitter<HomeBlocState> emit) {

    
    cartitems.add(event.cartproduct);
    emit(ProductCartedmsgState());


  }


  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, 
  Emitter<HomeBlocState> emit) {
  
  print("wishlist navigate");
  emit(HomeNavigateToWishlistPageActionState());

  }


  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, 
  Emitter<HomeBlocState> emit) {
    print("cart navigate");
    emit(HomeNavigateToCartPageActionState());
  }

  
}
