import 'package:daisy_frontend/page/register/states/registerStates.dart';
import 'package:daisy_frontend/page/register/widgets/molecule/label.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ToggleButtonUnit extends ConsumerStatefulWidget {
  final String label;
  late Gender target;

  ToggleButtonUnit({super.key, required this.label}) {
    if (label == "남자") {
      target = Gender.Male;
    } else {
      target = Gender.Female;
    }
  }

  @override
  ConsumerState<ToggleButtonUnit> createState() => _ToggleButtonUnitState();
}

class _ToggleButtonUnitState extends ConsumerState<ToggleButtonUnit> {
  onClick() {
    getRegisterStateProvider(ref).updateGender(widget.target);
  }

  @override
  Widget build(BuildContext context) {
    Color color;
    bool clicked = getRegisterState(ref).gender == widget.target;

    if (clicked) {
      color = ColorPalette.gray3;
    } else {
      color = ColorPalette.gray2;
    }

    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
          width: 80.w,
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.w),
              border: Border.all(color: color)),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(color: color),
            ),
          )),
    );
  }
}
