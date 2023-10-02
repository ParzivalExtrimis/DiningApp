import 'package:flutter_riverpod/flutter_riverpod.dart';

final ratingProvider =
    StateNotifierProvider<RatingNotifier, Map<String, double>>(
        (ref) => RatingNotifier());

class RatingNotifier extends StateNotifier<Map<String, double>> {
  RatingNotifier() : super({});

  void onRatingChanged(String mealId, double rating) {
    state = {...state, mealId: rating};
  }
}
