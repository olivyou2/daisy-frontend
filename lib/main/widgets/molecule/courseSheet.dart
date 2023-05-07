import 'package:daisy_frontend/main/widgets/molecule/courseTopIndicator.dart';
import 'package:daisy_frontend/util/onceActivator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseSheetController extends ChangeNotifier {
  bool maximized = false;

  void open() {
    maximized = true;
    notifyListeners();
  }

  void close() {
    maximized = false;
    notifyListeners();
  }
}

class CourseSheet extends StatefulWidget {
  final CourseSheetController controller;
  final Function mapSheetDetatchCallback;

  const CourseSheet(
      {super.key,
      required this.controller,
      required this.mapSheetDetatchCallback});

  @override
  State<CourseSheet> createState() => _CourseSheetState();
}

class _CourseSheetState extends State<CourseSheet> {
  bool animationDone = true;

  DraggableScrollableController sheetController =
      DraggableScrollableController();

  double closePosition = 0;
  double openPosition = 0.2;
  double fullyOpenPosition = 0.8;

  OnceActivator closeActivator = OnceActivator();

  _open() {
    setState(() {
      animationDone = false;
      closeActivator.deactivate();

      sheetController
          .animateTo(openPosition,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut)
          .then((value) {
        setState(() {
          animationDone = true;
        });
      });
    });
  }

  _close() {
    setState(() {
      animationDone = false;

      sheetController
          .animateTo(closePosition,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut)
          .then((value) {
        setState(() {
          animationDone = true;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();

    closeActivator.addListener(() {
      widget.mapSheetDetatchCallback();
    });

    sheetController.addListener(() {
      if (sheetController.size < 0.01 && animationDone) {
        closeActivator.activate();
      }
    });

    widget.controller.addListener(() {
      if (widget.controller.maximized) {
        _open();
      } else {
        _close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double minChildSize = closePosition;
    double maxChildSize = fullyOpenPosition;

    return DraggableScrollableSheet(
      initialChildSize: 0,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      snap: true,
      snapSizes: [closePosition, openPosition, fullyOpenPosition],
      controller: sheetController,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              // reverse: true,
              physics: const ClampingScrollPhysics(),
              child: Column(children: [const CourseTopIndicator()]),
            ),
          ],
        );
      },
    );
  }
}
