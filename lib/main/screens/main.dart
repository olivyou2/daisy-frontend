import 'package:daisy_frontend/main/widgets/atom/decoration/wideDecoration.dart';
import 'package:daisy_frontend/main/widgets/atom/description.dart';
import 'package:daisy_frontend/main/widgets/atom/map.dart';
import 'package:daisy_frontend/main/widgets/molecule/mainTopIndicator.dart';
import 'package:daisy_frontend/main/widgets/molecule/mapTopIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final combineWidth = 390.w - 47.w;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SizedBox(
                    width: combineWidth, child: const MainTopIndicator())),
            Padding(padding: EdgeInsets.only(top: 40.h)),
            _buildDecorationSet(),
          ],
        ),
        _mapScrollSheet()
      ]),
    );
  }

  Column _buildDecorationSet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: combineWidth, child: const Center(child: MainDescription())),
        Padding(padding: EdgeInsets.only(top: 12.h)),
        SizedBox(
          height: 160.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const WideDecoration();
            },
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 12.w),
              );
            },
          ),
        ),
      ],
    );
  }

  DraggableScrollableSheet _mapScrollSheet() {
    return DraggableScrollableSheet(
      snap: true,
      snapSizes: const [0.05, (844 - 58) / 844],
      initialChildSize: 0.05,
      minChildSize: 0.05,
      maxChildSize: (844 - 58) / 844,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              child: const TopIndicator(),
            ),
            const DaisyMap()
          ],
        );
      },
    );
  }
}
