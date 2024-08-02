import '../utils/params.dart';

class FavoriteModel {

  // favorite list
  final List<FoodParams> _favorites = [];

  List<FoodParams> get favorites => [..._favorites];

  // toggle favorite method
  void toggleFavorite(FoodParams food) {
    if (_favorites.contains(food)) {
      _favorites.remove(food);
    } else {
      _favorites.add(food);
    }
  }

  // check if favorite method
  bool isFavorite(FoodParams food) {
    return _favorites.contains(food);
  }
}
