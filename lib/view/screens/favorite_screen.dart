import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:retaurant_app_mvvm_design_pattern/view_model/favorite_view_model.dart';

import '../../utils/params.dart';
import 'food_details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteViewModel>(
        builder: (context, favoritesProvider, child) {
          return favoritesProvider.favorites.isNotEmpty? GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: favoritesProvider.favorites.length,
            itemBuilder: (context, index) {
              final favorite = favoritesProvider.favorites[index];
              return Stack(
                children: [
                  _foodItem(context, favorite),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        favoritesProvider.toggleFavorite(favorite);
                      },
                    ),
                  ),
                ],
              );
            },
          ) : const Center(child: Text('No favorite item'),);
        },
    );
  }
}

Widget _foodItem(BuildContext context, FoodParams foodParams) {
  final color = Theme.of(context).colorScheme;
  return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsScreen(foodParams: foodParams),
      ),
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 34),
      // margin: EdgeInsets.only(right: 44),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // image
          Container(
              width: 150,
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset('assets/images/${foodParams.icon}.jpg',fit: BoxFit.cover,))),

          // price
          const Gap(12),
          Text(
            '${foodParams.price} AFN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: color.primary,
            ),
          ),
          // name
          const Gap(8),
          Text(
            foodParams.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}
