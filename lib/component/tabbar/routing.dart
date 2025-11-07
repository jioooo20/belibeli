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
}

final goRouter = GoRouter(
  initialLocation: AppRoutes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/inventory',
      builder: (context, state) => InventoryPage(),
    ),
    GoRoute(
      path: '/sales',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Sales Page')),
      ),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('History Page')),
      ),
    ),
    GoRoute(
      path: '/add_product',
      builder: (context, state) => const AddProductPage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: ${state.error}'),
    ),
  ),
);