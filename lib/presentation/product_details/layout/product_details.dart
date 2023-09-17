import 'package:ecom_app_bloc/data/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecom_app_bloc/data/models/cart_add_request.dart';
import 'package:ecom_app_bloc/data/models/products_response.dart';
import 'package:ecom_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../widgets/ratings.dart';
import '../../../widgets/sliver_app_bar.dart';

class ProductDetails extends StatelessWidget {
  final Result product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.whiteColor,
      floatingActionButton: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartAddedState) {
            Fluttertoast.showToast(msg: state.result);
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPicker.primaryColor4,
              ),
              onPressed: () {
                CartAddRequestModel cartAddRequestModel = CartAddRequestModel(
                    title: product.title,
                    price: product.price,
                    discountPercentage: product.discountPercentage,
                    rating: product.rating,
                    stock: product.stock,
                    brand: product.brand,
                    category: product.category,
                    thumbnail: product.thumbnail);
                context
                    .read<CartBloc>()
                    .add(AddToCartEvent(cartAddRequestModel));
              },
              child: const Text(
                'Add To Cart',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            );
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: product.title,
          ),
          SliverFillRemaining(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        // color: Colors.blue,
                        child: Image.network(
                          product.thumbnail,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 20,
                          // overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        product.brand,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomRating(
                                initialRating: product.rating,
                                itemSize: 20,
                                padding: 2,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '( ${product.rating.toStringAsFixed(2)} )',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Price: \$${product.price.toString()}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: ColorPicker.primaryColor4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Discount: ${product.discountPercentage.toStringAsFixed(2)}%',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Stock: ${product.stock}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        product.description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
