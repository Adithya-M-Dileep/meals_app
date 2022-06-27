import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filters";

  Map<String, bool> currentFilters;
  Function setFilter;

  FilterScreen(this.currentFilters, this.setFilter);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  void initState() {
    _GlutenFree = widget.currentFilters["gluten"];
    _LactoseFree = widget.currentFilters["lactose"];
    _Vegan = widget.currentFilters["vegan"];
    _Vegetarian = widget.currentFilters["vegetarian"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> _newFilters = {
                "gluten": _GlutenFree,
                "lactose": _LactoseFree,
                "vegan": _Vegan,
                "vegetarian": _Vegetarian,
              };

              widget.setFilter(_newFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text("Gluten-free"),
                  value: _GlutenFree,
                  subtitle: Text("Only include gluten-free meals."),
                  onChanged: (newValue) {
                    setState(() {
                      _GlutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Lactose-free"),
                  value: _LactoseFree,
                  subtitle: Text("Only include lactose-free meals."),
                  onChanged: (newValue) {
                    setState(() {
                      _LactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Vegan"),
                  value: _Vegan,
                  subtitle: Text("Only include vegan meals."),
                  onChanged: (newValue) {
                    setState(() {
                      _Vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Vegetarian"),
                  value: _Vegetarian,
                  subtitle: Text("Only include vegetarian meals."),
                  onChanged: (newValue) {
                    setState(() {
                      _Vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
