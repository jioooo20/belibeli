# BeliBeli Architecture

## Laravel Blade-like Pattern in Flutter

This application uses a **Shell Layout Pattern** similar to Laravel's Blade templating system with `@extends`, `@yield`, and `@section` directives.

### How It Works

```
Laravel Blade                  →  Flutter ShellRoute
──────────────────────────────────────────────────────
@extends('layout.master')      →  ShellRoute wrapper
@section('header')             →  AppBar (persistent)
@section('footer')             →  TabBar (persistent)
@yield('content')              →  child widget (changes)
```

### Implementation

#### Master Layout (ScaffoldWithNavigation)
Located in: `lib/component/tabbar/routing.dart`

```dart
class ScaffoldWithNavigation extends StatelessWidget {
  final Widget child;  // Like @yield('content')
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),     // Always visible
      body: child,                 // Changes per route
      bottomNavigationBar: Tabbar(), // Always visible
    );
  }
}
```

#### Routes Configuration

```dart
ShellRoute(
  builder: (context, state, child) {
    return ScaffoldWithNavigation(child: child);
  },
  routes: [
    GoRoute(path: '/', pageBuilder: ...), // Dashboard
    GoRoute(path: '/inventory', pageBuilder: ...), // Inventory
    GoRoute(path: '/sales', pageBuilder: ...), // Sales
    GoRoute(path: '/history', pageBuilder: ...), // History
  ],
),
```

### Benefits

✅ **Memory Efficient**: AppBar and TabBar are created once, not on every navigation
✅ **Performance**: Faster navigation - only content widget rebuilds
✅ **Consistent UI**: AppBar and TabBar always present and in sync
✅ **Cleaner Code**: Pages don't need Scaffold, AppBar, or TabBar

### Page Structure

#### Old Way (Duplicated Code)
```dart
class DashboardPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),           // Repeated in every page
      body: YourContent(),
      bottomNavigationBar: Tabbar(),    // Repeated in every page
    );
  }
}
```

#### New Way (Shell Layout)
```dart
class DashboardPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return YourContent();  // Just the content!
  }
}
```

### Full-Screen Pages

For pages that need full screen without AppBar/TabBar (like modals or login):

```dart
// Define route OUTSIDE ShellRoute
GoRoute(
  path: '/add_product',
  builder: (context, state) => AddProductPage(),
),
```

### Navigation

```dart
// Navigate within shell (keeps AppBar & TabBar)
context.go('/inventory');

// Navigate to full-screen page
context.go('/add_product');

// Go back
context.pop();
```

### No Transitions

Uses `NoTransitionPage` for instant navigation between tabs:

```dart
pageBuilder: (context, state) => NoTransitionPage(
  child: const DashboardPage(),
),
```

This prevents animation lag when switching between tabs, making it feel like a native bottom navigation experience.
