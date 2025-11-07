import 'package:belibeli/component/app_theme/app_theme.dart';
import 'package:belibeli/component/tabbar/routing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: AppTheme.lightTheme,
    );
  }
}
