import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/color.dart';

class MenuBtnWidget extends StatefulWidget {
  final String menuName;
  final Function openCallback;

  const MenuBtnWidget(
      {super.key, required this.menuName, required this.openCallback});

  @override
  State<MenuBtnWidget> createState() => _MenuBtnWidgetState();
}

class _MenuBtnWidgetState extends State<MenuBtnWidget> {
  bool clicked = false;

  clickDown(details) {
    setState(() {
      clicked = true;
    });
  }

  clickUp(details) {
    setState(() {
      clicked = false;

      widget.openCallback();
    });
  }

  clickUpByCancel() {
    setState(() {
      clicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: clickDown,
      onTapUp: clickUp,
      onTapCancel: clickUpByCancel,
      child: SizedBox(
        width: 310.w,
        child: Column(children: [
          const Divider(
            thickness: 1,
            height: 1,
            color: ColorPalette.gray4,
          ),
          SizedBox(
            height: 80.h,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.menuName,
                      style: TextStyle(
                          color:
                              clicked ? ColorPalette.gray2 : ColorPalette.gray,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700)),
                  DaisyImages.menuGotoImage
                ]),
          ),
        ]),
      ),
    );
  }
}
