import 'package:daisy_frontend/recommand/widgets/atom/button.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: const Button(),
    );
  }
}
