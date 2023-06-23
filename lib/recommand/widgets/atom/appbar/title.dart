import 'package:flutter/material.dart';
import 'package:word_break_text/word_break_text.dart';

import '../../../../util/color.dart';

class Title extends StatelessWidget {
  final String _text;
  const Title(
    this._text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: WordBreakText(
        _text,
        style: const TextStyle(
          fontSize: 32,
          color: ColorPalette.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
