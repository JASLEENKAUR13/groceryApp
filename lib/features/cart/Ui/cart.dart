import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_grocery_app/features/cart/Ui/cart_tile_widget.dart';
import 'package:my_grocery_app/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:my_grocery_app/features/home/Ui/product_tile_widget.dart';

class Cart  extends StatefulWidget{
  @override
  _cart createState() => _cart();
  
  

}


class _cart extends State<Cart>{
  final CartBlocBloc cartbloc = CartBlocBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartbloc.add(cartInitialEvent());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        backgroundColor: Colors.pink[200],
      ),
      body : BlocProvider(create : (context) => cartbloc,
      child: BlocConsumer<CartBlocBloc, CartBlocState>(

        listener: (context, state) {
          if(state is AddedIntoWishlistedmsgState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added into Wishlist!") , duration: Duration(seconds: 1),));

          }else if (state is RemovedfromCartmsgState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("removed from cart") , duration: Duration(seconds : 1),));
          }
          
        },
        listenWhen: (previous , current )=> current is CartBlocActionState,
        buildWhen: (previous , current) => current is !CartBlocActionState,
        builder: (context, state) {
         
         switch(state.runtimeType){
          case CartSucessState: 
          final successState = state as CartSucessState;
          return ListView.builder(
            itemCount: successState.cartitems.length
              ,itemBuilder:(context , index) {
              return Cartproduct_widget(
                datamodel: successState.cartitems[index] , 
                cartbloc: cartbloc,);
            } );
            default: return Center(child: CircularProgressIndicator(),);
          
         }
        },
      ),)
    );
  }

}