import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/providers/rating_provider.dart';

import 'meals_label.dart';

class MealInfoCard extends ConsumerWidget {
  const MealInfoCard(this.model, {super.key});

  final MealModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 18,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MealsLabel(
                  color1: affordabilityColorMap[model.affordability]!
                      .withOpacity(0.9),
                  color2: affordabilityColorMap[model.affordability]!
                      .withOpacity(0.67),
                  label: model.affordability.name,
                ),
                const SizedBox(width: 6),
                MealsLabel(
                  color1:
                      complexityColorMap[model.complexity]!.withOpacity(0.9),
                  color2:
                      complexityColorMap[model.complexity]!.withOpacity(0.67),
                  label: model.complexity.name,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                    itemSize: 23,
                    initialRating: ref.watch(ratingProvider)[model.id] ?? 3.0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      ref
                          .read(ratingProvider.notifier)
                          .onRatingChanged(model.id, rating);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (model.isVegetarian)
                    Image.asset(
                      'images/vegetarian_icon.png',
                      color: Colors.lightGreen[300],
                      height: 45,
                      width: 45,
                    ),
                  if (model.isGlutenFree)
                    Image.asset(
                      'images/gluten_free_icon.png',
                      color: Colors.yellow[300],
                      height: 45,
                      width: 45,
                    ),
                  if (model.isLactoseFree)
                    Image.asset(
                      'images/lactose_free_icon.webp',
                      color: Colors.white,
                      height: 45,
                      width: 45,
                    ),
                  if (model.isVegan)
                    Image.asset(
                      'images/vegan_icon.png',
                      color: Colors.green[300],
                      height: 45,
                      width: 45,
                    ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Text(
                  'You will need: ',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Text(
                model.ingredients
                    .toString()
                    .substring(1, model.ingredients.toString().length - 1),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: model.steps
                    .map(
                      (step) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                step,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        overflow: TextOverflow.clip),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
