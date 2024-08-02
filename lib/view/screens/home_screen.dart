import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:retaurant_app_mvvm_design_pattern/view/widgets/food_items.dart';
import 'package:retaurant_app_mvvm_design_pattern/view_model/foods_view_model.dart';

import '../widgets/choice_chips.dart';
import '../widgets/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final name = Provider.of<FoodsViewModel>(context,listen: false).name;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // greeting
              Text('Welcome, ${name ?? 'Friend'}',style: textTheme.headlineSmall,),
              Gap(8),
              Text('What do you want to eat today',style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),

              // search text field
              Gap(16),
              SearchField(),

              // categories
              Gap(16),
              Text('Available for you',style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),

              // Choice chip
              Gap(16),
              ChoiceChips(),

              // food items
              Gap(16),
              FoodItems(),

              // best food of the week
              Gap(16),
              Text('Best foods of the day',style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
              Gap(16),
              BestFoodItems(),
              Gap(16),
          ],),
        ),
    );
  }
}
