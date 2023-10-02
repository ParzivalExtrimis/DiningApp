import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> filterMap = ref.watch(filterNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Filters'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          FilterTile(
            title: 'Vegetarian',
            subtitle: 'Select only food marked vegetarian.',
            val: filterMap[Filter.veg]!,
            pic: 'images/vegetarian_icon.png',
            picColor: Colors.lightGreen[300],
            onChanged: (value) {
              if (value != null) {
                ref
                    .read(filterNotifierProvider.notifier)
                    .toggleCheckbox(value, Filter.veg);
              }
            },
          ),
          FilterTile(
            title: 'Lactose-free',
            subtitle: 'Select only food marked lactose free.',
            val: filterMap[Filter.lactose]!,
            pic: 'images/lactose_free_icon.webp',
            picColor: Colors.white,
            onChanged: (value) {
              if (value != null) {
                ref
                    .read(filterNotifierProvider.notifier)
                    .toggleCheckbox(value, Filter.lactose);
              }
            },
          ),
          FilterTile(
            title: 'Gluten-free',
            subtitle: 'Select only food marked gluten free.',
            val: filterMap[Filter.gluten]!,
            pic: 'images/gluten_free_icon.png',
            picColor: Colors.yellow[300],
            onChanged: (value) {
              if (value != null) {
                ref
                    .read(filterNotifierProvider.notifier)
                    .toggleCheckbox(value, Filter.gluten);
              }
            },
          ),
          FilterTile(
            title: 'Vegan',
            subtitle: 'Select only food marked vegetarian.',
            val: filterMap[Filter.vegan]!,
            picColor: Colors.green[300],
            pic: 'images/vegan_icon.png',
            onChanged: (value) {
              if (value != null) {
                ref
                    .read(filterNotifierProvider.notifier)
                    .toggleCheckbox(value, Filter.vegan);
              }
            },
          ),
        ],
      ),
    );
  }
}

class FilterTile extends StatelessWidget {
  const FilterTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.val,
      required this.pic,
      required this.onChanged,
      this.picColor});

  final String title;
  final String subtitle;
  final bool val;
  final String pic;
  final Color? picColor;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            pic,
            color: picColor ?? Colors.white,
            fit: BoxFit.cover,
            height: 30,
            width: 30,
          ),
        ),
        Expanded(
          child: CheckboxListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(subtitle),
            ),
            value: val,
            onChanged: onChanged,
          ),
        ),
      ],
    ));
  }
}
