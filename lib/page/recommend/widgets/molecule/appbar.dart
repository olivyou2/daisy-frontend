import 'package:daisy_frontend/page/recommend/widgets/atom/appbar/description.dart';
import 'package:daisy_frontend/page/recommend/widgets/atom/appbar/subtitle.dart';
import 'package:daisy_frontend/page/recommend/widgets/atom/appbar/title.dart'
    as custom_title;
import 'package:flutter/material.dart';

import '../../../../util/color.dart';

class Appbar extends StatelessWidget {
  final String? subtitle;
  final String? description;
  final String title;

  const Appbar({
    super.key,
    this.subtitle,
    this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorPalette.yello2,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(26),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (subtitle != null) Subtitle(subtitle!),
          const SizedBox(height: 4),
          custom_title.Title(title),
          const SizedBox(height: 8),
          if (description != null) Description(description!)
        ],
      ),
    );
  }
}
