import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retaurant_app_mvvm_design_pattern/utils/custom_snackbar.dart';
import 'package:retaurant_app_mvvm_design_pattern/view_model/favorite_view_model.dart';

import '../../utils/params.dart';
import '../../view_model/cart_view_model.dart';

class FoodDetailsScreen extends StatelessWidget {
  final FoodParams foodParams;

  const FoodDetailsScreen({super.key, required this.foodParams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodParams.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // images
            Image.asset('assets/images/${foodParams.icon}.jpg'),

            // price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${foodParams.price} AFN",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber
                ),
              ),
            ),

            // name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                foodParams.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                foodParams.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),

      // floating buttons
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          // add to cart button
          FloatingActionButton(
            heroTag: 'second',
            onPressed: () {
              CustomSnackBar(contentText: 'Item added to the cart.', backgroundColor: Colors.amber).show(context);
              Provider.of<CartViewModel>(context, listen: false).addItem(foodParams);
            },
            child: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(height: 16),

          // toggle favorite button
          FloatingActionButton(
            heroTag: 'first',
            onPressed: () {
              Provider.of<FavoriteViewModel>(context, listen: false).toggleFavorite(foodParams);
              final favorite = Provider.of<FavoriteViewModel>(context, listen: false).isFavorite(foodParams);
              if(favorite){
                CustomSnackBar(contentText: 'Item added to the favorites.',backgroundColor: Colors.amber).show(context);
              }else{
                CustomSnackBar(contentText: 'Item removed from the favorites.', backgroundColor: Colors.grey).show(context);
              }
            },
            backgroundColor: Provider.of<FavoriteViewModel>(context).isFavorite(foodParams)
                ? Colors.amber
                : Colors.grey,
            child: const Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}