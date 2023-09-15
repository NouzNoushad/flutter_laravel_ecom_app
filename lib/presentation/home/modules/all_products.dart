import 'package:flutter/material.dart';

import '../../../data/models/products_response.dart';
import '../../../widgets/product_item.dart';

class AllProducts extends StatelessWidget {
  final List<Result> products;
  const AllProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var product = products[index];
          return ProductItem(
            product: product,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
        itemCount: products.length);
  }
}
