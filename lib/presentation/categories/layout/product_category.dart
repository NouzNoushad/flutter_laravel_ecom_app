import 'package:ecom_app_bloc/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/bloc/product_category_bloc/product_category_bloc.dart';
import '../../../data/models/products_response.dart';
import '../../../utils/colors.dart';

class ProductCategory extends StatelessWidget {
  final List<Result> products;
  final String category;
  const ProductCategory(
      {super.key, required this.products, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.whiteColor,
      body: BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
        builder: (context, state) {
          context
              .read<ProductCategoryBloc>()
              .add(ProductCategoryLoadedEvent(products, category));
          if (state is ProductCategoryLoadedState) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: ColorPicker.primaryColorLight2,
                  title: Text(
                    category,
                  ),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  sliver: SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      final category = state.products[index];
                      return ProductItem(
                        product: category,
                      );
                    },
                    itemCount: state.products.length,
                  ),
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
