import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  const CustomSliverAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: ColorPicker.primaryColorLight2,
      title: Text(
        title,
      ),
    );
  }
}
