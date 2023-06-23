import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: const Image(
        image: DaisyImages.decorationMockImage,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
