import 'package:daisy_frontend/page/register/states/registerStates.dart';
import 'package:daisy_frontend/page/register/widgets/molecule/label.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DatePicker extends ConsumerStatefulWidget {
  const DatePicker({super.key});

  @override
  ConsumerState<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends ConsumerState<DatePicker> {
  DateTime date = DateTime.now();
  bool isTouched = false;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Label(text: '생년월일', required: true),
        DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: ColorPalette.gray3),
            ),
          ),
          child: TextButton(
            onPressed: () => _showDialog(
              CupertinoDatePicker(
                dateOrder: DatePickerDateOrder.ymd,
                initialDateTime: date,
                maximumDate: date,
                maximumYear: date.year,
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    date = newDate;
                    getRegisterStateProvider(ref).updateBirth(date);
                    isTouched = true;
                  });
                },
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isTouched
                      ? '${date.year}-${date.month}-${date.day}'
                      : '생년월일을 선택해주세요',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: ColorPalette.gray3,
                      fontWeight: FontWeight.w500),
                ),
                SvgPicture.asset(
                  'assets/svgs/arrow_down.svg',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
