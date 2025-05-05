part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

sealed class HomeActionState extends HomeBlocState{}

final class HomeBlocInitial extends HomeBlocState {}


class HomeLoadingState extends HomeBlocState{}

class HomeLoadedSuccessState extends HomeBlocState{
    final List<ProductDatamodel> products;

  HomeLoadedSuccessState({required this.products});
    

}

class HomeErrorState extends HomeBlocState{}

class HomeNavigateToWishlistPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}


class ProductwishlistedmsgState extends HomeActionState{}

class ProductCartedmsgState extends HomeActionState{}