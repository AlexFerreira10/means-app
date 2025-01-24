import 'dart:ui';

class Category {
  final String _id;
  final String _title;
  final Color _color;

  get id => this._id;

  get title => this._title;

  get color => this._color;

  const Category({
    required String id,
    required String title,
    required Color color,
  })  : _id = id,
        _title = title,
        _color = color;
}
