import 'package:flutter/material.dart';
import 'package:meals_app/domain/model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required String title, required List<Meal> meals})
      : _meals = meals,
        _title = title;

  final String _title;
  final List<Meal> _meals;

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
          crossAxisAlignment: CrossAxisAlignment.center,
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

    return Scaffold(
      appBar: AppBar(
        title: content,
      ),
    );
  }
}
