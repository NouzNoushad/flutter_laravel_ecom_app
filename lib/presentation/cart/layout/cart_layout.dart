import 'package:ecom_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/bloc/cart_bloc/cart_bloc.dart';
import '../../../widgets/sliver_app_bar.dart';
import '../modules/cart_item.dart';

class CartLayout extends StatefulWidget {
  const CartLayout({super.key});

  @override
  State<CartLayout> createState() => _CartLayoutState();
}

class _CartLayoutState extends State<CartLayout> {
  @override
  void initState() {
    context.read<CartBloc>().add(const GetCartProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.whiteColor,
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            title: 'Cart',
          ),
          SliverFillRemaining(
            child: BlocConsumer<CartBloc, CartState>(
              listener: (context, state) {
                if (state is CartErrorState) {
                  Fluttertoast.showToast(msg: state.error);
                }
              },
              builder: (context, state) {
                if (state is CartLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorPicker.primaryColor2,
                    ),
                  );
                }
                if (state is GetCartProductsState) {
                  final num total = state.cartProducts.result.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + element.price);
                  if (state.cartProducts.result.isEmpty) {
                    return const Center(
                        child: Text(
                      'Your cart is Empty',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ));
                  }
                  return Column(
                    children: [
                      Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              itemBuilder: (context, index) {
                                var cart = state.cartProducts.result[index];
                                return CartItem(
                                  cart: cart,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 2,
                                  ),
                              itemCount: state.cartProducts.result.length)),
                      Container(
                        alignment: Alignment.bottomCenter,
                        color: ColorPicker.primaryColorLight2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Total : \$$total',
                              style: const TextStyle(
                                fontSize: 18,
                                color: ColorPicker.primaryColor3,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPicker.primaryColor2,
                              ),
                              child: const Text(
                                'Checkout',
                              ),
                            )),
                          ],
                        ),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
