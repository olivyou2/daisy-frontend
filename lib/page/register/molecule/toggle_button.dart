import 'package:daisy_frontend/page/register/molecule/label.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';

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
        ToggleButtons(
          renderBorder: false,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < _selectedGender.length; i++) {
                _selectedGender[i] = i == index;
              }
            });
          },
          isSelected: _selectedGender,
          selectedColor: ColorPalette.black,
          fillColor: Colors.white,
          children: List<Widget>.generate(
            2,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: _selectedGender[index]
                      ? ColorPalette.gray3
                      : ColorPalette.gray2,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              width: 80,
              height: 40,
              alignment: Alignment.center,
              child: gender[index],
            ),
          ),
        )
      ],
    );
  }
}
