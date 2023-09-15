import 'package:ecom_app_bloc/presentation/categories/layout/product_category.dart';
import 'package:ecom_app_bloc/presentation/home/layout/home_screen.dart';
import 'package:go_router/go_router.dart';

import 'route_constant.dart';

class Routes {
  static GoRouter goRouter = GoRouter(initialLocation: homeRoute, routes: [
    GoRoute(path: homeRoute, builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: categoryRoute,
        builder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return ProductCategory(
            products: args['products'],
            category: args['category'],
          );
        }),
  ]);
}
