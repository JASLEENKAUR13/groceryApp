
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_grocery_app/data/wishlist_items.dart';
import 'package:my_grocery_app/features/wishlist/Ui/wishlist_tile.dart';
import 'package:my_grocery_app/features/wishlist/bloc/wishlist_bloc_bloc.dart';

class Wishlist extends StatefulWidget{

  _wishlist createState() => _wishlist();
    
}

class _wishlist extends State<Wishlist>{
  final WishlistBlocBloc wistlistbloc = WishlistBlocBloc();

  @override
  void initState() {
    // TODO: implement initState
    wistlistbloc.add(WishlistIntialEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
        create: (context) => wistlistbloc,
        child: BlocConsumer<WishlistBlocBloc, WishlistBlocState>(
              listener: (context, state) {
                if(state is RemovedfromWishlistmsgState){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Removed from Wishlist") ,
                   duration: Duration(seconds: 1),
                  ));
                } else if (state is AddedIntoCartmsgState){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added To Cart!")));
                }
              },
              listenWhen: (previous, current) => current is WishlistActionState,
              buildWhen: (previous, current) => current is !WishlistActionState,
              builder: (context, state) {

                switch(state.runtimeType){
                  case WishlistSuccessState:
                  final successstate  = state as WishlistSuccessState;
                  return Scaffold(
                    appBar: AppBar(
                      title: Text("Wishlist"),
              backgroundColor: Colors.pink[200],
                      
                    ),

                    body: ListView.builder(itemBuilder: (context , index) {
                      return Wishlistproduct_widget(datamodel: successstate.wishlist[index], wishlistbloc: wistlistbloc);
                    } , itemCount: Wishlistitems.length,
                    )

                  );

                   default : 
                  return Center(child : CircularProgressIndicator());
                

                }
                
              },
              
        ));

              
            
      
    
  }

}