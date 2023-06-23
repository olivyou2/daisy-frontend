import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:word_break_text/word_break_text.dart';

class Description extends StatelessWidget {
  final String _description;

  const Description(this._description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: WordBreakText(
        _description,
        style: const TextStyle(
          fontSize: 12,
          color: ColorPalette.white,
        ),
      ),
    );
  }
}
