import 'package:daisy_frontend/main/widgets/molecule/course/courseTopIndicator.dart';
import 'package:daisy_frontend/main/widgets/molecule/map/mapSheet.dart';
import 'package:daisy_frontend/util/onceActivator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseSheetController extends ChangeNotifier {
  bool maximized = false;
  double height = 400.h;

  void setHeight(double height) {
    this.height = height;
    notifyListeners();
  }

  double getHeightRatio(BuildContext context) {
    return height / MediaQuery.of(context).size.height;
  }

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
  final MapMenuController menuController;
  final Function mapSheetDetatchCallback;

  late State<CourseSheet> states;

  CourseSheet(
      {super.key,
      required this.controller,
      required this.mapSheetDetatchCallback,
      required this.menuController});

  @override
  State<CourseSheet> createState() => _CourseSheetState();
}

class _CourseSheetState extends State<CourseSheet> {
  bool animationDone = true;

  DraggableScrollableController sheetController =
      DraggableScrollableController();

  double closePosition = 0;

  OnceActivator closeActivator = OnceActivator();

  _open() {
    setState(() {
      animationDone = false;
      closeActivator.deactivate();

      sheetController
          .animateTo(widget.controller.getHeightRatio(context),
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

  _windowEvent() {
    if (widget.controller.maximized) {
      _open();
    } else {
      _close();
    }
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

    widget.controller.addListener(_windowEvent);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_windowEvent);
  }

  @override
  Widget build(BuildContext context) {
    double minChildSize = closePosition;
    double maxChildSize = widget.controller.getHeightRatio(context);

    return DraggableScrollableSheet(
      initialChildSize: 0,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      snap: true,
      snapSizes: [minChildSize, maxChildSize],
      controller: sheetController,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              // reverse: true,
              physics: const ClampingScrollPhysics(),
              child: Column(children: [
                CourseTopIndicator(
                  sheetController: widget.controller,
                  mapMenuController: widget.menuController,
                )
              ]),
            ),
          ],
        );
      },
    );
  }
}
