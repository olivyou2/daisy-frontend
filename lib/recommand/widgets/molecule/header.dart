import 'package:flutter/material.dart';

import '../../../util/color.dart';

class Header extends StatelessWidget {
  final String _title;
  final VoidCallback _onPress;

  const Header(
    this._title,
    this._onPress, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _title,
            style: const TextStyle(
              color: ColorPalette.yello2,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: _onPress,
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              '지도에서 보기',
              style: TextStyle(
                color: ColorPalette.gray2,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
