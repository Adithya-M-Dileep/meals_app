import "package:flutter/material.dart";
import 'package:meals_app/models/meal.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> availableMeal;
  CategoryMealScreen(this.availableMeal);
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;
  bool _loadedInitData = false;
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final String id = routeArg["id"];
      categoryTitle = routeArg["title"];
      displayedMeal = widget.availableMeal.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  Function _removeItem(String mealId) {
    setState(() {
      displayedMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
