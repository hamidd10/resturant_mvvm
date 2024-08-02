import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retaurant_app_mvvm_design_pattern/utils/params.dart';
import 'package:retaurant_app_mvvm_design_pattern/view_model/foods_view_model.dart';

import '../../model/home_model.dart';

class ChoiceChips extends StatefulWidget {

  ChoiceChips({super.key});

  @override
  State<ChoiceChips> createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  final homeModel = HomeModel();

  int defaultChoiceIndex = 0;



  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
        Wrap(
          spacing: 12,
          children: List.generate(
              homeModel.choiceList.length,
              (i) => ChoiceChip(
                label: SizedBox(width: 50, child: Center(child: Text(homeModel.choiceList[i]))),
                selected: defaultChoiceIndex == i,
                showCheckmark: false,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side: BorderSide(color: Colors.grey[100]!)),
                selectedColor: color.primary,
                pressElevation: 0,
                backgroundColor: Colors.grey[100],
                onSelected: (value) {
                  setState(() {
                    defaultChoiceIndex = value ? i : defaultChoiceIndex;
                  });
                  var foodViewModel = Provider.of<FoodsViewModel>(context, listen: false);

                  switch (i) {
                    case 0:
                      foodViewModel.filterFoodList(Categories.all);
                      break;

                    case 1:
                      foodViewModel.filterFoodList(Categories.kebab);
                      break;

                    case 2:
                      foodViewModel.filterFoodList(Categories.pasta);
                      print('case 2');
                      break;

                    case 3:
                      foodViewModel.filterFoodList(Categories.burger);
                      print('case 3');
                      break;

                    case 4:
                      foodViewModel.filterFoodList(Categories.doner);
                      print('case 4');
                      break;

                    case 5:
                      foodViewModel.filterFoodList(Categories.steak);
                      print('case 5');
                      break;
                  }
                },
              )
            ,),
        )
      ],),
    );
  }
}
