import 'package:flutter/material.dart';
import 'package:meals_app/domain/model/category.dart';

class CategoriesGridItem extends StatelessWidget {
  const CategoriesGridItem({super.key, required category, required void Function() onSelectCategory})
      : _onSelectCategory = onSelectCategory,
        _category = category;

  final Category _category;
  final void Function() _onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              _category.color.withOpacity(0.55),
              _category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
