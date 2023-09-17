import 'package:ecom_app_bloc/data/bloc/category_bloc/category_bloc.dart';
import 'package:ecom_app_bloc/presentation/home/modules/carousel_screen.dart';
import 'package:ecom_app_bloc/presentation/home/modules/category_chips.dart';
import 'package:ecom_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../data/bloc/products_bloc/products_bloc.dart';
import '../../../routes/route_constant.dart';
import '../modules/all_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.whiteColor,
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is ProductsErrorState) {
            Fluttertoast.showToast(msg: state.error);
          }
        },
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorPicker.primaryColor2,
              ),
            );
          }
          if (state is ProductsLoadedState) {
            context
                .read<CategoryBloc>()
                .add(CategoryLoadedEvent(state.products));
            final products = state.products;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: ColorPicker.primaryColorLight2,
                  title: const Text(
                    'Bazar',
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          context.push(cartRoute);
                        },
                        icon: const Icon(Icons.shopping_cart))
                  ],
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate.fixed([
                    const CarouselScreen(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<CategoryBloc, CategoryState>(
                              builder: (context, state) {
                            if (state is CategoryLoadingState) {
                              return const CircularProgressIndicator(
                                color: ColorPicker.primaryColor2,
                              );
                            }
                            if (state is CategoryLoadedState) {
                              categories = state.categories;
                              return CategoryChips(
                                  products: products,
                                  categories: state.categories);
                            }
                            return Container();
                          }),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'All Products',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: ColorPicker.primaryColor2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.32,
                                  child: AllProducts(
                                    products: products,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ])),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
