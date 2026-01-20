import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/dummy_data.dart';
import 'package:tastynav_cuisines/model/meal.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favourites-meals';

  @override
  Widget build(BuildContext context) {
    final List<Meal> favouriteMeals =
        DUMMY_MEALS.where((meal) => meal.isFavourite).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Your Favourites')),
      body: favouriteMeals.isEmpty
          ? const Center(
              child: Text(
                'No favourites yet. Add some delicious meals!',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: favouriteMeals.length,
              itemBuilder: (context, index) {
                final Meal currMeal = favouriteMeals[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(currMeal.imageUrl),
                  ),
                  title: Text(currMeal.title),
                  subtitle: Text('${currMeal.duration} min'),
                );
              },
            ),
    );
  }
}