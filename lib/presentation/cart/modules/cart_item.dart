import 'package:ecom_app_bloc/data/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecom_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/models/cart_response.dart';
import '../../../widgets/ratings.dart';

class CartItem extends StatelessWidget {
  final Result cart;
  const CartItem(
      {super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartDeleteState) {
          Fluttertoast.showToast(msg: state.result);
        }
      },
      builder: (context, state) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            // color: Colors.yellow,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    cart.thumbnail,
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            cart.title,
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            cart.brand,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CustomRating(
                              initialRating: cart.rating,
                              itemSize: 12,
                              padding: 0,
                            ),
                          ),
                          Text(
                            '\$${cart.price}',
                            style: const TextStyle(
                                fontSize: 16, color: ColorPicker.primaryColor4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<CartBloc>()
                            .add(CartDeleteEvent(cart.id));
                      },
                      child: const Icon(
                        Icons.delete_outline,
                        color: ColorPicker.primaryColorLight2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
