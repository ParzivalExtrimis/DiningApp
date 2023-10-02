import 'package:flutter/material.dart';

enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

Map<Affordability, Color> affordabilityColorMap = {
  Affordability.affordable: Colors.lightGreen[300]!,
  Affordability.pricey: Colors.red[300]!,
  Affordability.luxurious: Colors.purple[300]!,
};

Map<Complexity, Color> complexityColorMap = {
  Complexity.simple: Colors.lightBlue[300]!,
  Complexity.challenging: Colors.amber[300]!,
  Complexity.hard: Colors.orange[300]!
};

class MealModel {
  const MealModel({
    required this.id,
    required this.categories,
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String name;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}
