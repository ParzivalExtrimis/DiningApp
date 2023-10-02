import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/widgets/meal_info_card.dart';

const double kDefaultSnapPosition = 0.62;

class MealInfoScreen extends ConsumerWidget {
  const MealInfoScreen({super.key, required this.model});

  final MealModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isThisFav = ref.watch(favoriteNotifierProvider).contains(model);

    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(favoriteNotifierProvider.notifier)
                    .onToggleFavorite(context, model);
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 00),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: Tween<double>(begin: 0, end: 1).animate(animation),
                    child: child,
                  );
                },
                child: Icon(Icons.star,
                    key: ValueKey(isThisFav),
                    color: isThisFav
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white),
              ))
        ],
      ),
      body: Hero(
        tag: model.id,
        child: Stack(
          children: [
            Image.network(
              model.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            DraggableScrollableSheet(
              expand: true,
              snap: true,
              snapSizes: const [kDefaultSnapPosition, 1.0],
              initialChildSize: kDefaultSnapPosition,
              minChildSize: kDefaultSnapPosition,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: MealInfoCard(model),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
