import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retaurant_app_mvvm_design_pattern/view_model/cart_view_model.dart';

import '../../utils/custom_snackbar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
        builder: (context, cartProvider, child) {
          return cartProvider.items.isNotEmpty? Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartProvider.items[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)
                      ),
                      child: ListTile(
                        leading: Image.asset(
                            'assets/images/${cartItem.foodParams.icon}.jpg', width: 50, height: 50),
                        title: Text(cartItem.foodParams.name,style: const TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Row(
                          children: [
                            IconButton(
                              color: Colors.amber,
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                cartProvider.decreaseQuantity(cartItem);
                              },
                            ),
                            Text('${cartItem.foodParams.price} AFN x ${cartItem.quantity}'),
                            IconButton(
                              color: Colors.amber,
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cartProvider.increaseQuantity(cartItem);
                              },
                            ),
                          ],
                        ),
                        trailing: Text(
                          '${int.parse(cartItem.foodParams.price) * cartItem.quantity} AFN',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber
                  ),
                  onPressed: () {
                    Provider.of<CartViewModel>(context,listen: false).sendOrders();
                    CustomSnackBar(contentText: 'Order placed successfully!',backgroundColor: Colors.amber).show(context);
                  },
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('ORDER',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                ),
              ),
            ],
          ) : const Center(child: Text('No item in the Cart'),);
        },
    );
  }
}
