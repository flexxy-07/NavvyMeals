import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/categories_screen.dart';
import 'package:tastynav_cuisines/favourite_screen.dart';
import 'package:tastynav_cuisines/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  List<Map<String, Object>> get _pages => [
        {'page': CategoriesScreen(), 'title': 'Categories'},
        {'page': FavouriteScreen(), 'title': 'Your Favourites'},
      ];
    
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String)),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [BottomNavigationBarItem(icon: Icon(Icons.celebration),
        backgroundColor: Theme.of(context).primaryColor,
          label: 'Categories',
        ),

        BottomNavigationBarItem(icon: Icon(Icons.star),
          label:  'Favourites',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        
        
        
        ],
      ),
    );
  }
}
