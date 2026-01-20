import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const String routeName = '/filter-meals';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(),
    );
  }
}