
import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/categories_screen.dart';
import 'package:tastynav_cuisines/category_meals_screen.dart';
import 'package:tastynav_cuisines/dummy_data.dart';
import 'package:tastynav_cuisines/favourite_screen.dart';
import 'package:tastynav_cuisines/filters_screen.dart';
import 'package:tastynav_cuisines/meal_item_details.dart';
import 'package:tastynav_cuisines/model/meal.dart';
import 'package:tastynav_cuisines/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();

}
class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterdData){
    setState(() {
      _filters = filterdData;

      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten']! && !meal.isGlutenFree) return false;
        if(_filters['lactose']! && !meal.isLactoseFree) return false;
        if(_filters['vegan']! && !meal.isVegan) return false;
        if(_filters['vegetarian']! && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Navvy Meals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink).copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyMedium: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          titleLarge: const TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            fontSize: 16,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
        ),
        useMaterial3: true,
      ),
     // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/' : (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetail.routeName: (ctx) => MealDetail(),
        FavouriteScreen.routeName: (ctx) => FavouriteScreen(),
        FiltersScreen.routeName : (ctx) => FiltersScreen(_setFilters, _filters)
      }, // first screen of the app
      
      // used when a router is not defined in routes table, then this will be called
      onGenerateRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());  
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (ctx) => CategoriesScreen(),
      ),
    );
  }
}
  

