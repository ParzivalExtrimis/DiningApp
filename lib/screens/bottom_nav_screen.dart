import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/category_model.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_options_screen.dart';
import 'package:meals/widgets/drawer_area.dart';
import 'package:uuid/uuid.dart';

final favCategory = CategoryModel(
  id: const Uuid().v4(),
  name: 'Favorites',
  color: Colors.black,
);

const List<String> navScreens = ['categories', 'favorites'];
const List<String> pageTitles = ['Pick a category', 'Favorites'];

class BottomNavScreen extends ConsumerStatefulWidget {
  final int activeScreen;
  const BottomNavScreen({super.key, currentScreen})
      : activeScreen = currentScreen ?? 0;
  @override
  ConsumerState<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends ConsumerState<BottomNavScreen> {
  int activeScreen = 0;

  @override
  void initState() {
    activeScreen = widget.activeScreen;
    super.initState();
  }

  void changeScreen(int index) {
    setState(() {
      activeScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<MealModel> favModels = ref.watch(favoriteNotifierProvider);
    final Map<String, Widget> navWidgetMap = {
      'categories': const CategoriesScreen(),
      'favorites': MealOptionsScreen.forFavorites(
        category: favCategory,
        mealModels: favModels,
      ),
    };
    return Scaffold(
      drawer: const DrawerArea(),
      appBar: AppBar(
        title: Text(pageTitles[activeScreen]),
      ),
      body: navWidgetMap[navScreens[activeScreen]],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeScreen,
        onTap: changeScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.apps_rounded), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
