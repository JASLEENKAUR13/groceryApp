import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_grocery_app/features/cart/Ui/cart.dart';
import 'package:my_grocery_app/features/home/Ui/product_tile_widget.dart';

import 'package:my_grocery_app/features/home/bloc/home_bloc_bloc.dart';
import 'package:my_grocery_app/features/wishlist/Ui/wishlist.dart';

class Home extends StatefulWidget {
  @override
  _home createState() => _home();
}

class _home extends State<Home> {
  final HomeBlocBloc homebloc = HomeBlocBloc();

  @override
  void initState() {
    // TODO: implement initState
    homebloc.add(HomeInitialEvent());
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homebloc,
      child: BlocConsumer<HomeBlocBloc, HomeBlocState>(
        listener: (context, state) {

          if(state is HomeNavigateToCartPageActionState){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
          }
          else if(state is HomeNavigateToWishlistPageActionState){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist()));
          }else if(state is ProductwishlistedmsgState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Added in Wishlist!") , duration: Duration(seconds: 1),
              ));
          }
          else if(state is ProductCartedmsgState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Added in Cart!",) , duration: Duration(seconds: 1),
              ));
          }

        },
        listenWhen:(previous , current) => current is HomeActionState,
        buildWhen: (previous , current) => current is !HomeActionState,
        builder: (context, state) {
          switch(state.runtimeType){
            case  HomeLoadingState : return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              )
            );


              

            case HomeLoadedSuccessState :
             final successState  = state as HomeLoadedSuccessState;
            return Scaffold(
            appBar: AppBar(
              title: Text("Grocery App"),
              backgroundColor: Colors.pink[200],
              
              actions: [
                IconButton(onPressed: () {
                  homebloc.add(HomeWishlistButtonNavigateEvent());  // passed the event to the bloc

                }, icon: Icon(Icons.favorite_border)
                ),
                IconButton(
                    onPressed: () {
                      homebloc.add((HomeCartButtonNavigateEvent()));
                    }, icon: Icon(Icons.shopping_bag_outlined)
                 ),
              ],
            ),

            body: ListView.builder(itemCount: successState.products.length
              ,itemBuilder:(context , index) {
              return product_widget(datamodel: successState.products[index] , homebloc: homebloc,);
            } ),
          );
              

            case HomeErrorState :  return Scaffold(
              body:Center(child:Text("error"))
            ) ;

            default:
            return SizedBox();

          


            
              

          }
        },
      ),
    );
  }
}


