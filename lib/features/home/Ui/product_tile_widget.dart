

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_grocery_app/features/home/bloc/home_bloc_bloc.dart';
import 'package:my_grocery_app/features/home/models/home_product_dataModel.dart';

class product_widget extends StatelessWidget{

  final ProductDatamodel  datamodel ;
   final HomeBlocBloc homebloc ;

  const product_widget({required this.datamodel, required this.homebloc});
  
  @override
  Widget build(BuildContext context) {
   
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
        )
      ,
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(

            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(datamodel.imageurl) , fit: BoxFit.fill),
              

            ),
            
           
          ) , 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [ Text(datamodel.name , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20)),
          Text(datamodel.descrpition)],
            ),
            //Spacer(),
            Column(children: [
              SizedBox(height: 6),
              Text( "\$${datamodel.price.toString()}" ,
             style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),
            ),
            Row( 
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              IconButton(onPressed: (){
                homebloc.add(HomeProductWishlistButtonClickedEvent( wishlistproduct: datamodel) );
                //Fluttertoast.showToast(msg: "Product added to Cart!");
              }, icon: Icon(Icons.favorite_border)),
              IconButton(onPressed: (){
                homebloc.add(HomeProductCartButtonClickedEvent(cartproduct: datamodel));
              }, icon: Icon(Icons.shopping_bag_outlined)),
            ],)

            ],)
            

            ] ,
            

         
          )
        ],
      ),
    );
   
  }

}