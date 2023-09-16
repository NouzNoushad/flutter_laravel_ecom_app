import 'package:ecom_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/sliver_app_bar.dart';

class CartLayout extends StatelessWidget {
  const CartLayout({super.key});

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
            child: Column(
              children: [
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              color: Colors.yellow,
                              child: Column(children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://i.dummyjson.com/data/products/17/thumbnail.jpg',
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: 2)),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height * 0.14,
                  color: Colors.yellow,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
