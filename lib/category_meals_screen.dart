import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/dummy_data.dart';
import 'package:tastynav_cuisines/meal_item.dart';
import 'package:tastynav_cuisines/model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   late String title = '';
   late List<Meal> filteredMeals = [];
  bool _loadedInitData = false;
  
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
      if (routeArgs != null) {
        title = routeArgs['title']!;
        final categoryId = routeArgs['id'];
        filteredMeals = DUMMY_MEALS.where((meal) {
          return meal.categories.contains(categoryId);
        }).toList();
      }
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      filteredMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            removeItem: _removeMeal,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
  // final String title;
  // final String id;

  // const CategoryMealsScreen({
  //   super.key,
  //   required this.title,
  //   required this.id,
  // });
}
