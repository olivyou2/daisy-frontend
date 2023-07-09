import 'package:daisy_frontend/page/register/widgets/atom/Require.dart';
import 'package:daisy_frontend/page/register/widgets/atom/Title.dart' as title;
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final bool required;

  const Label({super.key, required this.text, required this.required});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title.Title(text: text),
        required ? const Require() : const SizedBox(),
      ],
    );
  }
}
