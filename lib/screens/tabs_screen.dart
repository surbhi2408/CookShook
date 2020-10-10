import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
      'page': CategoriesScreen(),
      'title': 'Categories',
      },
      {
      'page': FavoritesScreen(widget.favoriteMeals),
      'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      //initialIndex: 0, // this helps to start from that index screen.
      Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
          // bottom: TabBar(
          //   tabs: <Widget>[
          //     Tab(icon: Icon(
          //         Icons.category
          //     ),
          //       text: 'Categories',
          //     ),
          //     Tab(icon: Icon(
          //       Icons.star,
          //     ),
          //       text: 'Favourites',
          //     ),
          //   ],
          // ),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          //type: BottomNavigationBarType.shifting, // for animation
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            )
          ],
        ),
        // body: TabBarView(
        //   children: <Widget>[
        //     CategoriesScreen(),
        //     FavoritesScreen(),
        //   ],
        // ),
    );
  }
}
