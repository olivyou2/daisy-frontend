import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:word_break_text/word_break_text.dart';

class Subtitle extends StatelessWidget {
  final String _subtitle;
  const Subtitle(
    this._subtitle, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: WordBreakText(
        _subtitle,
        style: const TextStyle(
          fontSize: 11,
          color: ColorPalette.white,
        ),
      ),
    );
  }
}
