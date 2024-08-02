import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retaurant_app_mvvm_design_pattern/model/theme_model.dart';
import 'package:retaurant_app_mvvm_design_pattern/view/onboarding/onboarding_screen1.dart';
import 'package:retaurant_app_mvvm_design_pattern/view/screens/home_screen.dart';
import 'package:retaurant_app_mvvm_design_pattern/view/screens/main_wrapper.dart';
import 'package:retaurant_app_mvvm_design_pattern/view_model/cart_view_model.dart';
import 'package:retaurant_app_mvvm_design_pattern/view_model/favorite_view_model.dart';
import 'package:retaurant_app_mvvm_design_pattern/view_model/foods_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FoodsViewModel(),),
        ChangeNotifierProvider(create: (context) => CartViewModel(),),
        ChangeNotifierProvider(create: (context) => FavoriteViewModel(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeModel().lightTheme,
        title: 'Arg Restaurant',
        home: OnboardingScreen1(),
      ),
    );
  }
}
