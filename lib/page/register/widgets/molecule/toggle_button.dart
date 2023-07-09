import 'package:daisy_frontend/page/register/widgets/molecule/label.dart';
import 'package:daisy_frontend/page/register/widgets/molecule/toggle_button_unit.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<Widget> gender = <Widget>[Text('남성'), Text('여성')];

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  final List<bool> _selectedGender = <bool>[false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label(text: '성별', required: true),
        Padding(padding: EdgeInsets.only(top: 8.h)),
        Row(
          children: [
            ToggleButtonUnit(label: "남자"),
            Padding(padding: EdgeInsets.only(left: 12.w)),
            ToggleButtonUnit(label: "여자")
          ],
        )
      ],
    );
  }
}
