import 'package:flutter/material.dart';
import 'package:meals_app/data/datasource/dummy_data.dart';
import 'package:meals_app/domain/model/category.dart';
import 'package:meals_app/domain/model/meal.dart';
import 'package:meals_app/presentation/pages/meals_screen.dart';
import 'package:meals_app/presentation/widgets/categories_grid_item.dart';
import 'package:page_transition/page_transition.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required List<Meal> availableMeals,
  }) : _availableMeals = availableMeals;

  final List<Meal> _availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = _availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      PageTransition(
        type: PageTransitionType.fade,
        child: MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoriesGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(context, category),
            ),
        ],
      );
}
