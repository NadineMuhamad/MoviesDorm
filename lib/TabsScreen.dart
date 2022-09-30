import 'package:flutter/material.dart';

import './Screens/MoviesScreen.dart';
import './Screens/favoriteScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Map<String, Object>> _pages = [
    {
      'page': const MoviesScreen(),
      'title': "Home",
    },
    {
      'page': const FavoritesScreen(),
      'title': "All Movies",
    },
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text("Movie Dorm"),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        // fixedColor: const Color(0xff191c36),
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        backgroundColor: Color(0xff211e2d),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite")
        ],
      ),
    );
  }
}
