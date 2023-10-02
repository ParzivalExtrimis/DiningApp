import 'package:flutter/material.dart';
import 'package:meals/models/category_model.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {super.key, required this.model, required this.onCategoryPicked});

  final CategoryModel model;
  final void Function() onCategoryPicked;
  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(12);
    return InkWell(
      onTap: onCategoryPicked,
      borderRadius: borderRadius,
      //splashColor: Color.fromARGB(255, 255, 255, 255),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: LinearGradient(
            colors: [
              model.color.withOpacity(0.65),
              model.color.withOpacity(0.9),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            model.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 32, 32, 32),
                ),
          ),
        ),
      ),
    );
  }
}
