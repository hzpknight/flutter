import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_demo/core/router/app_routes.dart';
import 'package:riverpod_demo/features/counter/presentation/home_page.dart';
import 'package:riverpod_demo/features/settings/presentation/settings_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.settings,
        name: 'settings',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SettingsPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          state.error?.toString() ?? 'Unknown navigation error',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    ),
  );
});
