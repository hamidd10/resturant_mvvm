import 'package:flutter/material.dart';
import '../model/cart_model.dart';
import '../utils/params.dart';

class CartViewModel with ChangeNotifier {
  CartModel cartModel = CartModel();

  List<CartItem> get items => cartModel.items;

  void addItem(FoodParams food) {
    cartModel.addItem(food);
    notifyListeners();
  }

  void increaseQuantity(CartItem cartItem) {
    cartModel.increaseQuantity(cartItem);
    notifyListeners();
  }

  void decreaseQuantity(CartItem cartItem) {
    cartModel.decreaseQuantity(cartItem);
    notifyListeners();
  }

  void sendOrders(){
    cartModel.sendOrders();
    notifyListeners();
  }
}
