import 'package:flutter/material.dart';
import 'package:meals_app/domain/model/meal.dart';
import 'package:meals_app/presentation/pages/meal_details_screen.dart';
import 'package:meals_app/presentation/widgets/meal_item.dart';
import 'package:page_transition/page_transition.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    String? title,
    required List<Meal> meals,
  })  : _meals = meals,
        _title = title;

  final String? _title;
  final List<Meal> _meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      PageTransition(
        type: PageTransitionType.fade,
        child: MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: _meals.length,
      itemBuilder: (ctx, index) => Text(
        _meals[index].title,
      ),
    );

    if (_meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing to show here',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      );
    }

    if (_meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: _meals[index],
          onSelectMeal: (meal) {
            _selectMeal(context, meal);
          },
        ),
      );
    }

    if (_title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: content,
    );
  }
}
