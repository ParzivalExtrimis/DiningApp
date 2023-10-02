import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal_model.dart';

enum Filter { veg, gluten, lactose, vegan }

final filterNotifierProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
        (ref) => FilterNotifier());

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.veg: false,
          Filter.gluten: false,
          Filter.lactose: false,
          Filter.vegan: false,
        });

  // toggleCheckbox
  void toggleCheckbox(bool value, Filter filter) {
    state = {
      ...state,
      filter: value,
    };
  }
}

final filteredMealsProvider = Provider((ref) {
  final filters = ref.watch(filterNotifierProvider);
  final List<MealModel> filteredModels = [];
  for (final MealModel m in dummyMeals) {
    if (!m.isGlutenFree && filters[Filter.gluten]!) {
      continue;
    } else if (!m.isLactoseFree && filters[Filter.lactose]!) {
      continue;
    } else if (!m.isVegetarian && filters[Filter.veg]!) {
      continue;
    } else if (!m.isVegan && filters[Filter.vegan]!) {
      continue;
    } else {
      filteredModels.add(m);
    }
  }
  return filteredModels;
});
