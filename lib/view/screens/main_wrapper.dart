import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:retaurant_app_mvvm_design_pattern/view/screens/cart_screen.dart';
import 'package:retaurant_app_mvvm_design_pattern/view/screens/favorite_screen.dart';
import 'package:retaurant_app_mvvm_design_pattern/view/screens/home_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  _MainWrapperState createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ARG',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
            Text(' Restaurant', style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}