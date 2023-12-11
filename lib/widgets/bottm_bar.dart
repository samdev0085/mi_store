import 'package:flutter/material.dart';
import 'package:my_store/const.dart';
import 'package:my_store/screens/Profile_screen.dart';
import 'package:my_store/screens/categ_screen.dart';
import 'package:my_store/screens/favorites_screen.dart';
import 'package:my_store/screens/products_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget toDisplay = Products_screen();
    if (screenIndex == 1) {
      toDisplay = const CategorisScreen();
    } else if (screenIndex == 2) {
      toDisplay = const FavoritesScreen();
    } else if (screenIndex == 3) {
      toDisplay = const ProfileScreen();
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: screenIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (value) {
          setState(() {
            screenIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Products',
            backgroundColor: kmajorColor,
            icon: ImageIcon(
              AssetImage('assets/products.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Categories',
            backgroundColor: kmajorColor,
            icon: ImageIcon(
              AssetImage('assets/categories.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            backgroundColor: kmajorColor,
            icon: ImageIcon(
              AssetImage('assets/favorites.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            backgroundColor: kmajorColor,
            icon: ImageIcon(
              AssetImage('assets/person.png'),
            ),
          ),
        ],
      ),
      body: toDisplay,
    );
  }
}
