import 'package:daisy_frontend/main/widgets/atom/indicator.dart';
import 'package:daisy_frontend/main/widgets/atom/placeInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseTopIndicator extends StatelessWidget {
  const CourseTopIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Indicator(height: 400.h, children: [
      const PlaceInput(),
      Padding(padding: EdgeInsets.only(top: 16.h)),
      // const PlaceInput(),
      // Padding(padding: EdgeInsets.only(top: 16.h)),
      // const PlaceInput(),
      // Padding(padding: EdgeInsets.only(top: 16.h)),
    ]);
  }
}
