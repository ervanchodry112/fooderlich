import 'package:fooderlich/models/models.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/favorite_screen.dart';
import '../screens/screens.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final GroceryManager groceryManager;

  AppRouter(this.appStateManager, this.profileManager, this.groceryManager);

  late final router = GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: appStateManager,
      initialLocation: '/login',
      routes: [
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (BuildContext context, GoRouterState state) =>
              const LoginScreen(),
        ),
        GoRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (BuildContext context, GoRouterState state) =>
              const OnboardingScreen(),
        ),
        GoRoute(
          name: 'home',
          path: '/:tab',
          builder: (BuildContext context, GoRouterState state) {
            final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
            return Home(key: state.pageKey, currentTab: tab);
          },
          routes: [
            GoRoute(
                name: 'favorites',
                path: 'favorites',
                builder: (BuildContext context, GoRouterState state) {
                  return const FavoriteScreen();
                }),
            GoRoute(
              name: 'item',
              path: 'item/:id',
              builder: (BuildContext context, GoRouterState state) {
                final itemId = state.params['id'] ?? '';
                final item = groceryManager.getGroceryItem(itemId);
                return GroceryItemScreen(
                  originalItem: item,
                  onCreate: (item) {
                    groceryManager.addItem(item);
                  },
                  onUpdate: (item) {
                    groceryManager.updateItem(item);
                  },
                );
              },
            ),
            GoRoute(
                name: 'profile',
                path: 'profile',
                builder: (BuildContext context, GoRouterState state) {
                  final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
                  return ProfileScreen(
                    user: profileManager.getUser,
                    currentTab: tab,
                  );
                },
                routes: [
                  GoRoute(
                    name: 'rw',
                    path: 'rw',
                    builder: (BuildContext context, GoRouterState state) =>
                        const WebViewScreen(),
                  ),
                ]),
          ],
        ),
      ],
      redirect: (state) {
        final loggedIn = appStateManager.isLoggedIn;
        final loggingIn = state.subloc == '/login';
        if (!loggedIn) {
          return loggingIn ? null : '/login';
        }

        final isOnBoardingComplete = appStateManager.isOnboardingComplete;
        final onboarding = state.subloc == '/onboarding';
        if (!isOnBoardingComplete) {
          return onboarding ? null : '/onboarding';
        }

        if (loggingIn || onboarding) {
          return '/${FooderlichTab.explore}';
        }
        return null;
      },
      errorPageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(
              child: Text(
                state.error.toString(),
              ),
            ),
          ),
        );
      });
}
