import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/meal_info_screen.dart';
import 'package:meals/widgets/meals_label.dart';
import 'package:transparent_image/transparent_image.dart';

class MealTile extends StatelessWidget {
  const MealTile({super.key, required this.model});

  final MealModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => MealInfoScreen(model: model)));
          },
          splashColor: const Color.fromARGB(20, 255, 255, 255),
          child: Column(
            children: [
              Stack(
                children: [
                  FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(
                      model.imageUrl,
                    ),
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset(
                      'images/connection_down.png',
                      color: Colors.white24,
                      fit: BoxFit.scaleDown,
                      width: double.infinity,
                      height: 220,
                    ),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 220,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: Text(
                  model.name,
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                child: Row(
                  children: [
                    SizedBox(
                      height: 35,
                      child: Row(
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
                            color1: complexityColorMap[model.complexity]!
                                .withOpacity(0.9),
                            color2: complexityColorMap[model.complexity]!
                                .withOpacity(0.67),
                            label: model.complexity.name,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (model.isVegetarian)
                            Image.asset(
                              'images/vegetarian_icon.png',
                              color: Colors.lightGreen[300],
                              height: 35,
                              width: 35,
                            ),
                          if (model.isGlutenFree)
                            Image.asset(
                              'images/gluten_free_icon.png',
                              color: Colors.yellow[300],
                              height: 35,
                              width: 35,
                            ),
                          if (model.isLactoseFree)
                            Image.asset(
                              'images/lactose_free_icon.webp',
                              color: Colors.white,
                              height: 35,
                              width: 35,
                            ),
                          if (model.isVegan)
                            Image.asset(
                              'images/vegan_icon.png',
                              color: Colors.green[300],
                              height: 35,
                              width: 35,
                            ),
                        ],
                      ),
                    ),
                    //   Expanded(
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         Image.asset(
                    //           'images/vegetarian_icon.png',
                    //           color: model.isVegetarian
                    //               ? Colors.lightGreen[300]
                    //               : Colors.grey.withOpacity(0.1),
                    //           height: 35,
                    //           width: 35,
                    //         ),
                    //         Image.asset(
                    //           'images/gluten_free_icon.png',
                    //           color: model.isGlutenFree
                    //               ? Colors.yellow[300]
                    //               : Colors.grey.withOpacity(0.1),
                    //           height: 35,
                    //           width: 35,
                    //         ),
                    //         Image.asset(
                    //           'images/lactose_free_icon.webp',
                    //           color: model.isLactoseFree
                    //               ? Colors.white
                    //               : Colors.grey.withOpacity(0.1),
                    //           height: 35,
                    //           width: 35,
                    //         ),
                    //         Image.asset(
                    //           'images/vegan_icon.png',
                    //           color: model.isVegan
                    //               ? Colors.green[300]
                    //               : Colors.grey.withOpacity(0.1),
                    //           height: 35,
                    //           width: 35,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
