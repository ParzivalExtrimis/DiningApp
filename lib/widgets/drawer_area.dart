import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/bottom_nav_screen.dart';
import 'package:meals/screens/filters_screen.dart';

class DrawerArea extends StatelessWidget {
  const DrawerArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 195,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.amber[400]!,
                    Colors.amber[300]!,
                  ],
                )),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'images/favpng_omelette-vegetable-frying-pan-cooking.png',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Sizzlr',
                    style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        fontSize:
                            Theme.of(context).textTheme.headlineLarge!.fontSize,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8.0),
            child: Text(
              'Go-to',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
              textAlign: TextAlign.start,
            ),
          ),
          const Divider(),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => const BottomNavScreen(
                            currentScreen: 0,
                          )),
                );
              },
              icon: const Icon(Icons.set_meal_sharp),
              label: const Text('Categories'),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const BottomNavScreen(
                              currentScreen: 1,
                            )),
                  );
                },
                icon: const Icon(Icons.favorite),
                label: const Text('Favorites')),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
                  );
                },
                icon: const Icon(Icons.tune),
                label: const Text('Filters')),
          ),
        ],
      ),
    );
  }
}
