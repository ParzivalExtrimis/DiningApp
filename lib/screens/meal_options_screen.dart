import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/category_model.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/widgets/meal_tile.dart';

class MealOptionsScreen extends ConsumerStatefulWidget {
  final CategoryModel category;
  final List<MealModel> mealModels;
  final bool appBarActive;

  MealOptionsScreen(
      {super.key, required this.category, required List<MealModel> meals})
      : mealModels =
            meals.where((m) => m.categories.contains(category.id)).toList(),
        appBarActive = true;

  const MealOptionsScreen.forFavorites(
      {super.key, required this.category, required this.mealModels})
      : appBarActive = false;

  @override
  ConsumerState<MealOptionsScreen> createState() => _MealOptionsScreenState();
}

class _MealOptionsScreenState extends ConsumerState<MealOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBarActive
          ? AppBar(title: Text(widget.category.name))
          : null,
      body: widget.mealModels.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'images/no_content.png',
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.4),
                    fit: BoxFit.scaleDown,
                    height: 300,
                    width: 250,
                  ),
                  Text(
                    'Nothing to see here ... yet',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.8)),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: widget.mealModels.length,
              itemBuilder: (ctx, ix) {
                return Hero(
                    tag: widget.mealModels[ix].id,
                    child: MealTile(model: widget.mealModels[ix]));
              },
            ),
    );
  }
}
