import 'package:daisy_frontend/main/widgets/molecule/map/mapSheet.dart';
import 'package:daisy_frontend/main/widgets/molecule/path/pathSheetIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PathController extends ChangeNotifier {
  double height = 0;

  setHeigth(double newHeight) {
    height = newHeight;
    notifyListeners();
  }
}

class PathSheet extends StatefulWidget {
  final MapSheetController mapSheetController;
  final MapMenuController mapMenuController;

  const PathSheet(
      {super.key,
      required this.mapSheetController,
      required this.mapMenuController});

  @override
  State<PathSheet> createState() => _PathSheetState();
}

class _PathSheetState extends State<PathSheet> {
  bool animationDone = true;

  DraggableScrollableController sheetController =
      DraggableScrollableController();

  double closePosition = 0.1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double minChildSize = closePosition;

    // set maxChildSize into scale by 786
    double maxChildSize = 786.h / MediaQuery.of(context).size.height;

    return DraggableScrollableSheet(
      initialChildSize: maxChildSize,
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
                PathTopIndicator(
                    mapSheetController: widget.mapSheetController,
                    mapMenuController: widget.mapMenuController)
              ]),
            ),
          ],
        );
      },
    );
  }
}
