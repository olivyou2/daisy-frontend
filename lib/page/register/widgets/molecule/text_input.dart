import 'package:daisy_frontend/page/register/states/registerStates.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:daisy_frontend/page/register/widgets/molecule/label.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TextInput extends ConsumerStatefulWidget {
  const TextInput({super.key});

  @override
  ConsumerState<TextInput> createState() => _TextInputState();
}

class _TextInputState extends ConsumerState<TextInput> {
  late TextEditingController _controller;
  late String name = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(changeName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeName() {
    String newName = _controller.text;
    getRegisterStateProvider(ref).updateName(newName);

    setState(() {
      name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label(text: '닉네임', required: true),
        TextField(
          maxLength: 15,
          controller: _controller,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: ColorPalette.gray3),
          decoration: InputDecoration(
              counterText: "",
              hintText: '이름을 입력해주세요',
              suffix: Text('${name.length}/15'),
              border: InputBorder.none,
              suffixStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.gray2,
                  height: 20 / 16),
              hintStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.gray2)),
        ),
        Divider(
          height: 1.h,
          thickness: 1.h,
          color: ColorPalette.gray3,
        )
      ],
    );
  }
}
