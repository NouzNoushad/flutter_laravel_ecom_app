import 'package:ecom_app_bloc/data/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecom_app_bloc/data/bloc/category_bloc/category_bloc.dart';
import 'package:ecom_app_bloc/data/bloc/login_bloc/login_bloc.dart';
import 'package:ecom_app_bloc/data/bloc/product_category_bloc/product_category_bloc.dart';
import 'package:ecom_app_bloc/data/bloc/products_bloc/products_bloc.dart';
import 'package:ecom_app_bloc/data/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:ecom_app_bloc/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/cart_repository.dart';
import '../data/repositories/products_repository.dart';

class BlocWidget extends StatelessWidget {
  final Widget child;
  const BlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductsRepository(),
        ),
        RepositoryProvider(
          create: (context) => CartRepository(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsBloc(
                productsRepository:
                    RepositoryProvider.of<ProductsRepository>(context))
              ..add(const ProductsLoadedEvent()),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(
                productsRepository:
                    RepositoryProvider.of<ProductsRepository>(context)),
          ),
          BlocProvider(
            create: (context) => ProductCategoryBloc(
                productsRepository:
                    RepositoryProvider.of<ProductsRepository>(context)),
          ),
          BlocProvider(
              create: (context) => CartBloc(
                  cartRepository:
                      RepositoryProvider.of<CartRepository>(context))
              ),
          BlocProvider(
              create: (context) => SignUpBloc(
                  authRepository:
                      RepositoryProvider.of<AuthRepository>(context))),
          BlocProvider(
              create: (context) => LoginBloc(
                  authRepository:
                      RepositoryProvider.of<AuthRepository>(context))),
        ],
        child: child,
      ),
    );
  }
}
