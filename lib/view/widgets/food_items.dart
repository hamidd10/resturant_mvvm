import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:retaurant_app_mvvm_design_pattern/utils/params.dart';
import 'package:retaurant_app_mvvm_design_pattern/view/screens/food_details_screen.dart';
import 'package:retaurant_app_mvvm_design_pattern/view_model/foods_view_model.dart';

class FoodItems extends StatelessWidget {
  const FoodItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodsViewModel>(
      builder: (context, foodViewModel, child) {
        final foodsList = foodViewModel.filteredFoodList;
        return SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) =>
                _footItem(context, foodsList[i]),
            itemCount: foodsList.length,
          ),
        );
      },
    );
  }
}
class BestFoodItems extends StatelessWidget {
  const BestFoodItems({super.key});

  @override
  Widget build(BuildContext context) {
    final bestFoodsList = Provider.of<FoodsViewModel>(context,listen: false).bestFoodList;
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => _footItem(context, bestFoodsList[i]),
        itemCount: bestFoodsList.length,
      ),
    );
  }
}


Widget _footItem(BuildContext context, FoodParams foodParams) {
  final color = Theme.of(context).colorScheme;
  return GestureDetector(
    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => FoodDetailsScreen(foodParams: foodParams),)),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 28,horizontal: 34),
      margin: EdgeInsets.only(right: 44),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24)
      ),
      child: Column(children: [

        // image
        Container(
            width: 150,
            height: 90,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/images/${foodParams.icon}.jpg',fit: BoxFit.cover,))),

        // price
        Gap(12),
        Text('${foodParams.price} AFN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: color.primary),),

        // name
        Gap(8),
        Text(foodParams.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

      ],),
    ),
  );
}
