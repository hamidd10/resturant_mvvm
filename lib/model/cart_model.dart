import '../utils/params.dart';

class CartModel {
  final List<CartItem> _items = [];

  List<CartItem> get items => [..._items];

  // add item to the cart
  void addItem(FoodParams food) {
    int index = _items.indexWhere((item) => item.foodParams.name == food.name);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(foodParams: food, quantity: 1));
    }
  }

  // increase the quantity
  void increaseQuantity(CartItem cartItem) {
    cartItem.quantity++;
  }

  // decrease the quantity
  void decreaseQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      _items.remove(cartItem);
    }
  }

  // send orders
  void sendOrders(){
    _items.clear();
  }
}
