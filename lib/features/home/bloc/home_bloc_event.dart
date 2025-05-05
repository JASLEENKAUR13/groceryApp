part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}


//create the events class 

// used to show intialization (errorstate , loading state or successstate)
class HomeInitialEvent extends HomeBlocEvent{

}

//adding to wishlist button event 
class HomeProductWishlistButtonClickedEvent extends HomeBlocEvent{
  final ProductDatamodel wishlistproduct;
  HomeProductWishlistButtonClickedEvent({required this.wishlistproduct});

}

//liking the product button event 
class HomeProductCartButtonClickedEvent extends HomeBlocEvent{
  final ProductDatamodel cartproduct;
  HomeProductCartButtonClickedEvent({required this.cartproduct});

}

//naivagte to the wishlist button event 
class HomeWishlistButtonNavigateEvent extends HomeBlocEvent{

}

//navigate to the liked screen event
class HomeCartButtonNavigateEvent extends HomeBlocEvent{

} 

