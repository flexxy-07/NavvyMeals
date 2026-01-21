import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filter-meals';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenScreenState createState() => _FiltersScreenScreenState();
}

class _FiltersScreenScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState(){
    super.initState();
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!; 
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
  }
  Widget buildSwitchListTileView(
    String title,
    String subTitle,
    bool value,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters'),
      actions: [IconButton(
        icon: const Icon(Icons.save),
        onPressed:(){
          final selectedFilters = {
            'gluten' : _glutenFree,
            'lactose' : _lactoseFree,
            'vegan' : _vegan,
            'vegetarian' : _vegetarian
          };
          widget.saveFilters(selectedFilters);
        },
      )],),
      
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTileView(
                  'Gluten Free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTileView(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTileView(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                buildSwitchListTileView(
                  'Lactose Free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
