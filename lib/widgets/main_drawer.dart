import "package:flutter/material.dart";

import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildItems(String title, IconData icon, Function taskHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: "RobotoCondensed",
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: taskHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Theme.of(context).accentColor,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          child: Text(
            "Cooking up...",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 28,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildItems(
          "Meals",
          Icons.restaurant,
          () {
            Navigator.of(context).pushReplacementNamed("/");
          },
        ),
        buildItems(
          "Filters",
          Icons.settings,
          () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          },
        ),
      ],
    );
  }
}
