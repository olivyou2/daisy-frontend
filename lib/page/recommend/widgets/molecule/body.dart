import 'package:daisy_frontend/page/recommend/widgets/atom/line.dart';
import 'package:daisy_frontend/page/recommend/widgets/molecule/list_item.dart';
import 'package:flutter/material.dart';

import 'header.dart';

class Body extends StatelessWidget {
  final String listTitle;

  const Body({super.key, required this.listTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(listTitle, () {}),
          const SizedBox(height: 20),
          const ListItem(),
          const Line(),
          const ListItem(),
          const Line(),
          const ListItem(),
          const Line(),
          const ListItem(),
          const Line(),
          const ListItem(),
          const Line(),
          const ListItem(),
          const Line(),
          const ListItem(),
          const Line(),
          const ListItem(),
        ],
      ),
    );
  }
}
