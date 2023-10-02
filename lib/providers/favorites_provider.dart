import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal_model.dart';

final favoriteNotifierProvider =
    StateNotifierProvider<FavoriteNotifier, List<MealModel>>(
        (ref) => FavoriteNotifier());

class FavoriteNotifier extends StateNotifier<List<MealModel>> {
  FavoriteNotifier() : super([]);

  // toggle favorites
  void onToggleFavorite(BuildContext context, MealModel model) {
    final message = ScaffoldMessenger.of(context);
    message.clearSnackBars();
    if (state.contains(model)) {
      message.showSnackBar(
        SnackBar(
            duration: const Duration(seconds: 2),
            content: const Text('Removed from favorites.'),
            action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  state = [...state, model];
                })),
      );
      state = state.where((m) => m.id != model.id).toList();
    } else {
      message.showSnackBar(
        SnackBar(
            duration: const Duration(seconds: 2),
            content: const Text('Added to favorites.'),
            action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  state = state.where((m) => m.id != model.id).toList();
                })),
      );
      state = [...state, model];
    }
  }

  bool isFavMeal(String modelId) {
    return state.contains(dummyMeals.firstWhere((m) => m.id == modelId));
  }
}
