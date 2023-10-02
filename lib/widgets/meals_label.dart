import 'package:flutter/material.dart';

class MealsLabel extends StatelessWidget {
  const MealsLabel({
    super.key,
    required this.color1,
    required this.color2,
    required this.label,
  });

  final Color color1;
  final Color color2;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            color1.withOpacity(0.85),
            color2.withOpacity(0.55),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4.5),
        child: Text(
          label.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
