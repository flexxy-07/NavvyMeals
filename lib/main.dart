
import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/categories_screen.dart';
import 'package:tastynav_cuisines/category_meals_screen.dart';
import 'package:tastynav_cuisines/meal_item_details.dart';
import 'package:tastynav_cuisines/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
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
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetail.routeName: (ctx) => MealDetail(),
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
