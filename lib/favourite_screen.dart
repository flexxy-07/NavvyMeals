import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/dummy_data.dart';
import 'package:tastynav_cuisines/model/meal.dart';

class FavouriteScreen extends StatefulWidget {
  static const routeName = '/favourites-meals';

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late List<Meal> _favouriteMeals;

  @override
  void initState() {
    super.initState();
    _favouriteMeals = DUMMY_MEALS.where((meal) => meal.isFavourite).toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      final int mealIndex = DUMMY_MEALS.indexWhere((meal) => meal.id == mealId);
      if (mealIndex != -1) {
        DUMMY_MEALS[mealIndex].isFavourite = false;
      }
      _favouriteMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Your Favourites')),
      body: _favouriteMeals.isEmpty
          ? const Center(
              child: Text(
                'No favourites yet. Add some delicious meals!',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: _favouriteMeals.length,
              itemBuilder: (context, index) {
                final Meal currMeal = _favouriteMeals[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(currMeal.imageUrl),
                  ),
                  title: Text(currMeal.title),
                  subtitle: Text('${currMeal.duration} min'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    color: Theme.of(context).colorScheme.error,
                    onPressed: () => _removeMeal(currMeal.id),
                    tooltip: 'Remove from favourites',
                  ),
                  // Keep the tile tap inert so only the icon removes
                  onTap: null,
                );
              },
            ),
    );
  }
}