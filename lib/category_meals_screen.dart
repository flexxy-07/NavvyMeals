import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/dummy_data.dart';
import 'package:tastynav_cuisines/meal_item.dart';
import 'package:tastynav_cuisines/model/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String title;
  // final String id;

  // const CategoryMealsScreen({
  //   super.key,
  //   required this.title,
  //   required this.id,
  // });
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    final filteredMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Meal currMeal = filteredMeals[index];
          return MealItem(
            id: currMeal.id,
            title: currMeal.title,
            imageUrl: currMeal.imageUrl,
            duration: currMeal.duration,
            complexity: currMeal.complexity,
            affordability: currMeal.affordability,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
