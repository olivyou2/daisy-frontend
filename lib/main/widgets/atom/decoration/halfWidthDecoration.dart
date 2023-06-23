import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HalfWidthDecoration extends StatefulWidget {
  final double height;

  final Text? overlayText;
  final Text? subOverlayText;
  final Widget? textTopWidget;

  Color? backgroundColor;

  HalfWidthDecoration(
      {super.key,
      this.backgroundColor,
      this.overlayText,
      this.subOverlayText,
      this.textTopWidget,
      required this.height});

  @override
  State<HalfWidthDecoration> createState() => _HalfWidthDecorationState();
}

class _HalfWidthDecorationState extends State<HalfWidthDecoration> {
  @override
  Widget build(BuildContext context) {
    List<Widget> overlayWidgets = [];

    if (widget.textTopWidget != null) {
      overlayWidgets.add(widget.textTopWidget!);
      overlayWidgets.add(Padding(padding: EdgeInsets.only(top: 6.h)));
    }

    if (widget.subOverlayText != null) {
      overlayWidgets.add(widget.subOverlayText!);
    }

    if (widget.overlayText != null) {
      overlayWidgets.add(widget.overlayText!);
    }

    return Container(
      width: 168.w,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? ColorPalette.yello,
          borderRadius: BorderRadius.all(Radius.circular(16.w))),
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: overlayWidgets),
      ),
    );
  }
}
