import 'package:belibeli/component/appbar/appbar.dart';
import 'package:belibeli/component/tabbar/tabbar.dart';
import 'package:belibeli/pages/dashboard/dashboard.dart';
import 'package:belibeli/pages/inventory/add/add_product.dart';
import 'package:belibeli/pages/inventory/inven.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
  static const String inventory = '/inventory';
  static const String sales = '/sales';
  static const String history = '/history';
  static const String addProduct = '/add_product';
}

// This is like Laravel's master layout (@extends('layout.master'))
class ScaffoldWithNavigation extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavigation({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(), // Always visible (like @section('header'))
      body: child, // This is like @yield('content') - changes per route
      bottomNavigationBar: const Tabbar(), // Always visible (like @section('footer'))
    );
  }
}

final goRouter = GoRouter(
  initialLocation: AppRoutes.home,
  debugLogDiagnostics: true,
  routes: [
    // ShellRoute keeps AppBar and TabBar persistent across all child routes
    // This is the Flutter equivalent of Laravel's @extends and @yield
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithNavigation(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) => NoTransitionPage(
            child: const DashboardPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.inventory,
          pageBuilder: (context, state) => NoTransitionPage(
            child: InventoryPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.sales,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Center(child: Text('Sales Page')),
          ),
        ),
        GoRoute(
          path: AppRoutes.history,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Center(child: Text('History Page')),
          ),
        ),
      ],
    ),
    // Routes outside ShellRoute won't have the persistent layout
    // Use this for full-screen pages like modals, login, etc.
    GoRoute(
      path: AppRoutes.addProduct,
      builder: (context, state) => const AddProductPage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: ${state.error}'),
    ),
  ),
);