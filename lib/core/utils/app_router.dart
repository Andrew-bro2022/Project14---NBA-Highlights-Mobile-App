import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nba_highlights/features/splash/presentation/pages/splash_screen.dart';
import 'package:nba_highlights/features/home/presentation/pages/home_screen.dart';
import 'package:nba_highlights/features/details/presentation/pages/details_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/details/:id',
        builder: (context, state) => DetailsScreen(
          id: state.pathParameters['id'] ?? '',
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          'Error: ${state.error}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    ),
  );
}
