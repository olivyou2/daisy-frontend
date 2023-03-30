import 'package:daisy_frontend/main/widgets/molecule/courseSheet.dart';
import 'package:flutter/material.dart';

import '../atom/map.dart';
import 'mapTopIndicator.dart';

class MapSheet extends StatefulWidget {
  const MapSheet({super.key});

  @override
  State<MapSheet> createState() => _MapSheetState();
}

class _MapSheetState extends State<MapSheet> {
  static double middleScrollPosition = (844 - 58) / 844;
  static double initScrollPosition = 0.05;
  static double attachedScrollPosition = 1;

  List<double> defaultSnap = [initScrollPosition, middleScrollPosition];
  List<double> maximizeSnap = [attachedScrollPosition];

  bool animationDone = true;

  DraggableScrollableController controller = DraggableScrollableController();
  CourseSheetController courseSheetController = CourseSheetController();

  bool maximized = false;

  _attach() {
    setState(() {
      maximized = true;
      animationDone = false;

      courseSheetController.open();

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller
            .animateTo(attachedScrollPosition,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut)
            .then((value) {
          setState(() {
            animationDone = true;
          });
        });
      });
    });
  }

  _deattach() {
    setState(() {
      maximized = false;
      animationDone = false;

      courseSheetController.close();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller
            .animateTo(middleScrollPosition,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut)
            .then((value) {
          setState(() {
            animationDone = true;
          });
        });
      });
    });
  }

  _close() {
    setState(() {
      maximized = false;
      animationDone = false;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller
            .animateTo(initScrollPosition,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut)
            .then((value) {
          setState(() {
            animationDone = true;
          });
        });
      });
    });
  }

  _debugAttach() {
    setState(() {
      if (maximized) {
        _deattach();
      } else {
        _attach();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<double> snaps = maximized ? maximizeSnap : defaultSnap;

    double maxChildSize = animationDone
        ? (maximized
            ? _MapSheetState.attachedScrollPosition
            : _MapSheetState.middleScrollPosition)
        : _MapSheetState.attachedScrollPosition;

    double minChildSize = (maximized && animationDone)
        ? maxChildSize
        : _MapSheetState.initScrollPosition;

    double initialChildSize = (maximized && animationDone)
        ? maxChildSize
        : _MapSheetState.initScrollPosition;

    return Stack(children: [
      _sheet(snaps, initialChildSize, minChildSize, maxChildSize),
      CourseSheet(
        controller: courseSheetController,
        mapSheetDetatchCallback: () => _deattach(),
      )
    ]);
  }

  DraggableScrollableSheet _sheet(List<double> snaps, double initialChildSize,
      double minChildSize, double maxChildSize) {
    return DraggableScrollableSheet(
      snap: true,
      snapSizes: snaps,
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      controller: controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              child: const MapTopIndicator(),
            ),
            DaisyMap(
              attachCallback: () {
                _debugAttach();
              },
            )
          ],
        );
      },
    );
  }
}
