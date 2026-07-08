import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {

  final currentIndex;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex
  });

  void onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      elevation: 0,
      selectedItemColor: colors.primary,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home_sharp),
          label: 'Inicio'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.local_fire_department_outlined),
          activeIcon: Icon(Icons.local_fire_department_rounded),
          label: 'Populares'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          activeIcon: Icon(Icons.favorite_sharp),
          label: 'Favoritos'
        ),
      ],
    );
  }
}