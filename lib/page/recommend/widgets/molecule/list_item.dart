import 'package:daisy_frontend/page/recommend/widgets/atom/image.dart';
import 'package:flutter/material.dart';

import '../../../../util/color.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const CircleImage(),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '누메로도스',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.black,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: const [
                  Text(
                    '성수동',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.gray3,
                    ),
                  ),
                  Text(
                    ' | ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.gray3,
                    ),
                  ),
                  Text(
                    '음식점',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.gray3,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
