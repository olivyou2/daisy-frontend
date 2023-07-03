import 'package:daisy_frontend/main/widgets/atom/profileImage.dart';
import 'package:daisy_frontend/main/widgets/molecule/menu/MenuWidget.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTopIndicator extends StatefulWidget {
  final MenuWidgetController menuController;
  const MainTopIndicator({super.key, required this.menuController});

  @override
  State<MainTopIndicator> createState() => _MainTopIndicatorState();
}

class _MainTopIndicatorState extends State<MainTopIndicator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 77.h)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ProfileImage(),
            SizedBox(
              width: 72.w,
              height: 30.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: DaisyImages.bellImage),
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        widget.menuController.open();
                      },
                      icon: DaisyImages.burgerImage)
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
