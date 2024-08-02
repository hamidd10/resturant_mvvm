import 'package:flutter/cupertino.dart';
import 'package:retaurant_app_mvvm_design_pattern/model/home_model.dart';

import '../utils/params.dart';

class FoodsViewModel extends ChangeNotifier{
  final homeModel = HomeModel();

  String? name;

  List<FoodParams> _filteredFoodList = [];

  FoodsViewModel() {
    _filteredFoodList = foodList;
  }

  List<FoodParams> get foodList {
    return [...homeModel.foodList];
  }

  List<FoodParams> get filteredFoodList {
    return [..._filteredFoodList];
  }

  void filterFoodList(Categories category) {
    if (category == Categories.all) {
      _filteredFoodList = foodList;
    } else {
      _filteredFoodList = foodList.where((food) => food.category == category).toList();
    }
    notifyListeners();
  }

  List<FoodParams> get bestFoodList => [...homeModel.bestFoodsList];

}