import 'package:ecom_app_bloc/routes/route_constant.dart';
import 'package:ecom_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/products_response.dart';

class CategoryChips extends StatelessWidget {
  final List<Result> products;
  final List<String> categories;
  const CategoryChips({super.key, required this.categories, required this.products});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: categories.map((category) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () => context.push(categoryRoute, extra: {
              'products': products,
              'category': category
            }),
            child: Chip(
                backgroundColor: ColorPicker.primaryColorLight2,
                label: Text(
                  category,
                  style: const TextStyle(color: ColorPicker.primaryColor2),
                )),
          ),
        );
      }).toList(),
    );
  }
}
