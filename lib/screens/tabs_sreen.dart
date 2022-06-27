import "package:flutter/material.dart";

import "./category_screen.dart";
import './favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedScreenIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        "page": CategoryScreen(),
        "title": "Categories",
      },
      {
        "page": FavoritScreen(widget.favoriteMeals),
        "title": "Your Favorite",
      }
    ];
    super.initState();
  }

  void selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedScreenIndex]["title"] as String),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedScreenIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorites",
            ),
          ]),
    );
  }
}
