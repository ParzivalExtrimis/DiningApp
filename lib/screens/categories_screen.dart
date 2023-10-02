import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category_model.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/meal_options_screen.dart';
import 'package:meals/widgets/category_tile.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  final List<CategoryModel> models = availableCategories;
  //final void Function() onSideDrawerButtonClicked;

  void onCategoryPicked(BuildContext context, CategoryModel categoryModel,
      List<MealModel> meals) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealOptionsScreen(
                  category: categoryModel,
                  meals: meals,
                )));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MealModel> filteredModels = ref.watch(filteredMealsProvider);
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
        ),
        children: models.map((model) {
          return CategoryTile(
              model: model,
              onCategoryPicked: () =>
                  onCategoryPicked(context, model, filteredModels));
        }).toList(),
      ),
    );
  }
}
