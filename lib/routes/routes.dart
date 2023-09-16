import 'package:ecom_app_bloc/presentation/cart/layout/cart_layout.dart';
import 'package:ecom_app_bloc/presentation/categories/layout/product_category.dart';
import 'package:ecom_app_bloc/presentation/home/layout/home_screen.dart';
import 'package:ecom_app_bloc/presentation/product_details/layout/product_details.dart';
import 'package:go_router/go_router.dart';

import '../data/models/products_response.dart';
import 'route_constant.dart';

class Routes {
  static GoRouter goRouter = GoRouter(initialLocation: cartRoute, routes: [
    GoRoute(path: homeRoute, builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: detailsRoute,
        builder: (context, state) => ProductDetails(
              product: state.extra as Result,
            )),
    GoRoute(
        path: categoryRoute,
        builder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return ProductCategory(
            products: args['products'],
            category: args['category'],
          );
        }),
    GoRoute(path: cartRoute, builder: (context, state) => const CartLayout()),
  ]);
}
