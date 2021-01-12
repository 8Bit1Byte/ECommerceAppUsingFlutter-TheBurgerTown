import 'package:theBT/model/fooditem.dart';

class Category {
  final int id;
  final String name;
  final List<FoodItem> foodList;

  Category({
    this.id,
    this.name,
    this.foodList,
  });
}
