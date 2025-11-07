import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({Key? key}) : super(key: key);

  int _getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location == '/') {
      return 0;
    } else if (location.startsWith('/sales')) {
      return 1;
    } else if (location.startsWith('/inventory')) {
      return 2;
    } else if (location.startsWith('/history')) {
      return 3;
    }
    return 0;
  }

  void _navigateToRoute(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/sales');
        break;
      case 2:
        context.go('/inventory');
        break;
      case 3:
        context.go('/history');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: NavigationBar(
        onDestinationSelected: (int index) {
          _navigateToRoute(context, index);
        },
        selectedIndex: _getCurrentIndex(context),
        backgroundColor: Colors.white,
        indicatorColor: Colors.lightGreen[100],
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_rounded),
            selectedIcon: Icon(Icons.dashboard_rounded, color: Colors.white),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_rounded),
            selectedIcon: Icon(Icons.shopping_cart_rounded, color: Colors.white),
            label: 'Sales',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_rounded),
            selectedIcon: Icon(Icons.inventory_2_rounded, color: Colors.white),
            label: 'Inventory',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_rounded),
            selectedIcon: Icon(Icons.history_rounded, color: Colors.white),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
