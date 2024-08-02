import 'package:flutter/material.dart';
import '../model/favorite_model.dart';
import '../utils/params.dart';

class FavoriteViewModel with ChangeNotifier {
  FavoriteModel favoriteModel = FavoriteModel();

  List<FoodParams> get favorites => favoriteModel.favorites;

  void toggleFavorite(FoodParams food) {
    favoriteModel.toggleFavorite(food);
    notifyListeners();
  }

  bool isFavorite(FoodParams food) {
    return favoriteModel.isFavorite(food);
  }
}
