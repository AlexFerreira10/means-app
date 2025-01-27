import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required IconData icon,
    required String label,
  })  : _icon = icon,
        _label = label;

  final IconData _icon;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          _icon,
          size: 17,
          color: Colors.white,
        ),
        Text(
          _label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
