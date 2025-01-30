import 'package:flutter/material.dart';
import 'package:meals_app/domain/model/meal.dart';
import 'package:meals_app/presentation/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required Meal meal,
    required void Function(Meal meal) onSelectMeal,
  })  : _meal = meal,
        _onSelectMeal = onSelectMeal;

  final Meal _meal;
  final void Function(Meal meal) _onSelectMeal;

  String get _complexityText {
    return _meal.complexity.name[0].toUpperCase() + _meal.complexity.name.substring(1);
  }

  String get _affordailityText {
    return _meal.affordability.name[0].toUpperCase() + _meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge, // Force the shape
      elevation: 2,
      child: InkWell(
        onTap: () {
          _onSelectMeal(_meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: _meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(_meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 4,
                ),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      _meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${_meal.duration} mins',
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.work,
                          label: _complexityText,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.work,
                          label: _affordailityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
