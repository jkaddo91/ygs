import 'meal_model.dart';

class Restaurant {
  String name;
  String imageUrl;
  String location;
  List<Meal> meals;

  Restaurant({
    this.name,
    this.imageUrl,
    this.location,
    this.meals
  });
}